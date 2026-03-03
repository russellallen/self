# Local CI — Tutorial

This guide walks you through setting up and running the local CI system for Self. It builds vm64 (64-bit) on macOS, Linux, FreeBSD, and NetBSD, and the legacy vm (32-bit) on Ubuntu AMD64, FreeBSD i386, and NetBSD i386 — all using QEMU virtual machines.

## Prerequisites

Install QEMU, sshpass, and just on your Mac:

```bash
brew install qemu sshpass just
```

That's it. QEMU includes the EFI firmware needed for ARM64 VMs.

## Step 1: Verify your environment

```bash
cd tools/ci
just check-env
```

This checks that all required tools are installed.

## Step 2: Download and provision VM images

Set up all images at once:

```bash
just setup-all
```

Or set up individual platforms:

```bash
just setup-ubuntu-arm64           # Ubuntu ARM64 (vm64, near-native speed)
just setup-ubuntu-amd64           # Ubuntu AMD64 (vm64, emulated)
just setup-ubuntu-amd64-multilib   # Ubuntu AMD64 multilib (vm 32-bit, emulated)
just setup-freebsd-arm64          # FreeBSD ARM64 (vm64)
just setup-freebsd-i386           # FreeBSD i386 (vm)
just setup-netbsd-arm64           # NetBSD ARM64 (vm64, manual provisioning)
just setup-netbsd-i386            # NetBSD i386 (vm, manual provisioning)
```

### Ubuntu (ARM64 and AMD64)

Ubuntu cloud images use cloud-init, which automatically creates the `ci` user and installs packages on first boot. The VM will shut down automatically when provisioning completes. The AMD64 image installs standard packages for vm64 builds. The separate Ubuntu AMD64 multilib image installs additional multilib packages for 32-bit vm builds.

Note: the AMD64 images are emulated (TCG) and boot slowly (~2-5 minutes).

### FreeBSD

FreeBSD is provisioned automatically via an `expect` script that drives the QEMU serial console. The script boots the VM, logs in as root, creates the `ci` user, installs packages, configures SSH and sudo, then shuts down.

### NetBSD

NetBSD requires manual provisioning. Log in as `root` (no password), then:

```bash
# Create ci user
useradd -m -G wheel ci
echo 'ci' | passwd ci

# Install packages
# For ARM64:
pkgin -y install cmake gcc12 libX11 libXext ncurses rsync
# For i386 (also needs jemalloc):
pkgin -y install cmake gcc12 libX11 libXext ncurses rsync jemalloc

# Enable SSH
echo 'sshd=YES' >> /etc/rc.conf
/etc/rc.d/sshd start

shutdown -p now
```

## Step 3: Run CI builds

### Quick start — build everything

```bash
just fullrun-all        # All platforms, both vm64 and vm
```

### Run by VM codebase

```bash
just fullrun-vm64       # All vm64 platforms (macOS, Ubuntu ARM64, Ubuntu AMD64)
just fullrun-vm         # All vm platforms (Ubuntu AMD64, FreeBSD i386)
```

### Run individual platforms

```bash
# vm64
just vm64-macos-native  # Fastest — no VM, runs directly
just vm64-ubuntu-arm64   # Near-native speed on Apple Silicon
just vm64-ubuntu-amd64   # Emulated, slower

# vm (32-bit)
just vm-ubuntu-amd64     # 32-bit build via multilib on AMD64
just vm-freebsd-i386    # Native i386 FreeBSD
just vm-netbsd-i386     # Native i386 NetBSD
```

### See all available recipes

```bash
just                    # Shows grouped recipe list
```

## Advanced usage

### Manual VM control

You can start/stop VMs independently and run commands manually:

```bash
just start-ubuntu-arm64                          # Boot the VM
just do $(cat ubuntu-arm64.port) 'uname -a'     # Run a command on it
just do $(cat ubuntu-arm64.port) 'cmake --version'  # Run another command
just stop-ubuntu-arm64                           # Shut it down
```

### Clean slate

```bash
just reset-everything   # Delete all images and logs
```

## Troubleshooting

**"Disk image not found"** — Run `just setup-<platform>` first.

**SSH connection refused** — The VM may still be booting. The script waits up to 120 seconds. If it still fails, try re-provisioning the image.

**"sshpass: command not found"** — Install it: `brew install sshpass` (may need `brew install hudochenkov/sshpass/sshpass`).

**x86_64 build is very slow** — This is expected. Software emulation (TCG) runs at ~5-10x slower than native. Budget 10-20 minutes for x86_64 builds.

**QEMU firmware not found** — Make sure QEMU is installed via Homebrew: `brew install qemu`. The EFI firmware is at `/opt/homebrew/share/qemu/edk2-aarch64-code.fd`.

**"just: command not found"** — Install it: `brew install just`.
