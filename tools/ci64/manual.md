# Local CI for vm64 — Technical Manual

## Architecture overview

The CI system boots QEMU virtual machines, rsyncs the source tree in, runs `cmake` + `make`, and reports pass/fail. All state lives under `tools/ci64/`.

```
tools/ci64/
├── build-all.sh           Main entry point
├── build-native.sh        macOS native build (no VM)
├── build-vm.sh            Generic VM build runner
├── setup-images.sh        Download and provision VM images
├── configs/               Per-platform QEMU configuration
│   ├── linux-arm64.conf
│   ├── linux-amd64.conf
│   ├── freebsd-arm64.conf
│   └── netbsd-arm64.conf
├── provision/             First-boot dependency scripts
│   ├── linux.sh
│   ├── freebsd.sh
│   └── netbsd.sh
├── images/                VM disk images (gitignored)
└── logs/                  Build logs (gitignored)
```

## How build-vm.sh works

1. **Loads config** — Sources `configs/<platform>.conf` which defines `QEMU_CMD`, `SSH_PORT`, `SSH_USER`, `SSH_PASS`, `DISK_IMAGE`, `CMAKE_FLAGS`, and `NPROC_CMD`.

2. **Boots QEMU** — Starts the VM in the background with `-snapshot` mode (writes go to a temporary overlay, base image is never modified). A UNIX monitor socket is created for clean shutdown.

3. **Waits for SSH** — Polls SSH on the forwarded port for up to 120 seconds.

4. **Rsyncs source** — Copies the entire source tree into `/tmp/self-build` inside the VM, excluding build artifacts, `.git`, and VM images.

5. **Builds** — Runs `cmake` and `cmake --build` over SSH.

6. **Reports and cleans up** — Captures the exit code, sends `system_powerdown` via the QEMU monitor, and kills the process on exit (via trap).

## QEMU acceleration

| Guest arch | On Apple Silicon | Acceleration | Speed |
|-----------|-----------------|-------------|-------|
| aarch64 | Yes | HVF (`-accel hvf`) | Near-native |
| x86_64 | Yes | TCG (software) | ~5-10x slower |

ARM64 guests use Apple's Hypervisor.framework (HVF), which runs guest code directly on the CPU. x86_64 guests use QEMU's Tiny Code Generator (TCG) for binary translation.

## Config file format

Each `.conf` file is sourced as a bash script. Required variables:

| Variable | Description | Example |
|----------|-------------|---------|
| `DISK_IMAGE` | Path to disk image (relative to `tools/ci64/`) | `images/ubuntu-arm64.qcow2` |
| `SSH_PORT` | Host port forwarded to guest :22 | `2222` |
| `SSH_USER` | SSH username | `ci` |
| `SSH_PASS` | SSH password | `ci` |
| `CMAKE_FLAGS` | Extra cmake flags | `-DSELF_QUARTZ=OFF` |
| `NPROC_CMD` | Command to get CPU count in guest | `nproc` |
| `QEMU_CMD` | Full QEMU launch command | (see examples) |

The `QEMU_CMD` must not include `-pidfile` or `-monitor` flags — those are added by `build-vm.sh`.

## SSH port allocation

Each platform uses a unique port to allow parallel builds:

| Platform | SSH port |
|----------|---------|
| linux-arm64 | 2222 |
| linux-amd64 | 2223 |
| freebsd-arm64 | 2224 |
| netbsd-arm64 | 2225 |

## Snapshot mode

All CI builds use QEMU's `-snapshot` flag on the disk image. This means:
- The base image is never modified during builds
- Each build starts from a clean state
- No cleanup needed after builds
- Multiple concurrent builds from the same image are safe

Only `setup-images.sh provision` boots without `-snapshot` (to save provisioning changes).

## Adding a new platform

1. **Download an image** — Add a download function to `setup-images.sh`.

2. **Create a config** — Add `configs/<platform>.conf` with all required variables. Pick an unused SSH port.

3. **Create a provision script** — Add `provision/<os>.sh` with package installation commands.

4. **Provision the image** — Add a case to the `provision_vm()` function in `setup-images.sh`. Boot, create the `ci` user, install deps, shut down.

5. **Register the platform** — Add the platform name to `ALL_VM_PLATFORMS` in `build-all.sh`.

6. **Test** — Run `./tools/ci64/build-vm.sh <platform>` to verify.

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
| Ubuntu | g++ | `cmake g++ libx11-dev libxext-dev libncurses-dev` |
| FreeBSD | gcc (pkg) | `cmake gcc libX11 libXext ncurses` |
| NetBSD | gcc12 (pkgin) | `cmake gcc12 libX11 libXext ncurses` |

## Disk image management

Images live in `tools/ci64/images/` and are gitignored. They are large (1-4 GB each) and should not be committed.

To re-provision an image, delete it and re-download:

```bash
rm tools/ci64/images/ubuntu-arm64.qcow2
./tools/ci64/setup-images.sh linux-arm64
./tools/ci64/setup-images.sh provision linux-arm64
```

## Logs

Build logs are written to `tools/ci64/logs/<platform>.log` and also displayed on stdout. Logs are gitignored.
