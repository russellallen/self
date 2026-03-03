# Local CI — Technical Manual

## Architecture overview

The CI system boots QEMU virtual machines, rsyncs the source tree in, runs `cmake` + `make`, and reports pass/fail. All recipes live in `tools/ci/Justfile`.

It supports two VM codebases:
- **vm64** (64-bit) — builds on macOS native, Ubuntu ARM64, Ubuntu AMD64
- **vm** (32-bit) — builds on Ubuntu AMD64 multilib, FreeBSD i386, NetBSD i386

```
tools/ci/
├── Justfile                      Unified CI — all recipes
├── provision/                    First-boot dependency scripts
│   ├── linux.sh                  Ubuntu/Debian reference
│   ├── freebsd.sh                FreeBSD ARM64 reference
│   ├── freebsd-i386.sh           FreeBSD i386 reference
│   ├── freebsd-console.exp       FreeBSD ARM64 automated provisioning
│   ├── freebsd-i386-console.exp  FreeBSD i386 automated provisioning
│   ├── netbsd.sh                 NetBSD ARM64 reference
│   └── netbsd-i386.sh            NetBSD i386 reference (+ jemalloc)
├── images/                       VM disk images (gitignored)
└── logs/                         Build logs (gitignored)
```

## How VM builds work

1. **Starts QEMU** — Boots the VM in the background with `-snapshot` mode and `-daemonize`. A PID file is written for clean shutdown.

2. **Waits for SSH** — Polls SSH on the forwarded port for up to 120 seconds.

3. **Rsyncs source** — Copies the entire source tree into `/tmp/self-build` inside the VM, excluding build artifacts, images, and snapshots.

4. **Builds and tests** — Runs `cmake` and `cmake --build` over SSH. For vm64, tests include VM tests, snapshot creation, snapshot loading, and Self test suite. For vm, tests use the worldBuilder with `--runAutomaticTests --snapshotActionPostRead`.

5. **Stops VM** — Sends `sudo poweroff` via SSH, waits for the process to exit, then cleans up the PID file.

Each `vm64-X` / `vm-X` recipe is self-contained and ensures the VM is always stopped even on failure.

## QEMU acceleration

| Guest arch | On Apple Silicon | Acceleration | Speed |
|-----------|-----------------|-------------|-------|
| aarch64 | Yes | HVF (`-accel hvf`) | Near-native |
| x86_64 | Yes | TCG (software) | ~5-10x slower |

ARM64 guests use Apple's Hypervisor.framework (HVF), which runs guest code directly on the CPU. x86_64 guests use QEMU's Tiny Code Generator (TCG) for binary translation.

## SSH port allocation

SSH ports are dynamically assigned at VM boot time. Each `start-*` recipe picks a free port using the `_free-port` helper (which binds a socket to port 0 and reads the OS-assigned port), writes it to `<name>.port`, and launches QEMU with that port. This eliminates port conflicts when running multiple VMs or when stale QEMU processes hold ports.

The `.port` files are read by the top-level recipes and cleaned up by `stop-*`. You can read the port of a running VM with `cat <name>.port`.

## Snapshot mode

All CI builds use QEMU's `-snapshot` flag on the disk image. This means:
- The base image is never modified during builds
- Each build starts from a clean state
- No cleanup needed after builds
- Multiple concurrent builds from the same image are safe

Only setup recipes boot without `-snapshot` (to save provisioning changes).

## vm64 vs vm build differences

| | vm64 | vm (32-bit) |
|---|---|---|
| cmake source | `cmake -S vm64` | `cmake -S vm` |
| Build dir | `build` | `build` |
| Test steps | 4: VM tests, snapshot build, snapshot load, Self suite | 1: worldBuilder with `--runAutomaticTests` |
| FreeBSD compiler | system gcc | `CC=gcc13 CXX=g++13` |

Each VM codebase uses its own dedicated image, so there is no build directory collision.

## Adding a new platform

1. **Download an image** — Add download URL as a Justfile variable. Add a `setup-<name>` recipe.

2. **Add start/stop recipes** — Define `start-<name>` and `stop-<name>` in the Advanced group. Use `_free-port` for dynamic port allocation.

3. **Add a compile recipe** — Create `_vm64-compile-<name>` or `_vm-compile-<name>` (private recipe).

4. **Add a top-level recipe** — Create `vm64-<name>` or `vm-<name>` that starts, compiles, and stops.

5. **Register in fullrun** — Add the recipe to `fullrun-vm64` or `fullrun-vm` dependencies.

6. **Create a provision script** — Add `provision/<os>.sh` with package installation commands.

7. **Test** — Run `just vm64-<name>` or `just vm-<name>` to verify.

## CMake flags

| Platform | Graphics | Flags |
|----------|----------|-------|
| macOS | Quartz (default) | (none needed) |
| Linux | X11 | `-DSELF_QUARTZ=OFF` |
| FreeBSD | X11 | `-DSELF_QUARTZ=OFF` |
| NetBSD | X11 | `-DSELF_QUARTZ=OFF` |

## Build dependencies

| Platform | Compiler | Packages |
|----------|----------|----------|
| macOS | Xcode clang | `cmake` |
| Ubuntu ARM64 | g++ | `cmake g++ libx11-dev libxext-dev libncurses-dev rsync` |
| Ubuntu AMD64 | g++ | `cmake g++ libx11-dev libxext-dev libncurses-dev rsync` |
| Ubuntu AMD64 multilib | g++ + multilib | `cmake g++ rsync` + `gcc-multilib g++-multilib libc6-dev-i386 libx11-dev:i386 libxext-dev:i386 libncurses-dev:i386` |
| FreeBSD ARM64 | gcc (pkg) | `cmake gcc libX11 libXext ncurses rsync sudo` |
| FreeBSD i386 | gcc13 (pkg) | `cmake gcc13 binutils libX11 libXext rsync sudo` |
| NetBSD ARM64 | gcc12 (pkgin) | `cmake gcc12 libX11 libXext ncurses rsync` |
| NetBSD i386 | gcc12 (pkgin) | `cmake gcc12 libX11 libXext ncurses rsync jemalloc` |

## Disk image management

Images live in `tools/ci/images/` and are gitignored. They are large (1-4 GB each) and should not be committed.

To re-provision an image, delete it and re-run setup:

```bash
rm tools/ci/images/ubuntu-arm64.qcow2
cd tools/ci && just setup-ubuntu-arm64
```

## The `do` recipe

The `do port COMMAND` recipe executes shell commands on a running VM. It hex-encodes the command to avoid SSH quoting issues, then decodes and runs it inside the VM via `bash --login`.

```bash
just do $(cat ubuntu-arm64.port) 'echo hello world'
```
