# Local CI for vm64 — Tutorial

This guide walks you through setting up and running the local CI system for vm64. It builds the VM on macOS, Linux (ARM64 + x86_64), FreeBSD, and NetBSD using QEMU virtual machines.

## Prerequisites

Install QEMU and sshpass on your Mac:

```bash
brew install qemu sshpass
```

That's it. QEMU includes the EFI firmware needed for ARM64 VMs.

## Step 1: Download VM images

```bash
./tools/ci64/setup-images.sh
```

This downloads disk images for all platforms into `tools/ci64/images/` (about 3-5 GB total). Images are cached — re-running skips already-downloaded images.

To download a single platform:

```bash
./tools/ci64/setup-images.sh linux-arm64
```

## Step 2: Provision the images

Each VM image needs a one-time setup to install build dependencies and create a `ci` user.

### Ubuntu (ARM64 and AMD64)

Ubuntu cloud images use cloud-init, which automatically creates the `ci` user and installs packages on first boot:

```bash
./tools/ci64/setup-images.sh provision linux-arm64
```

Wait for cloud-init to finish (you'll see log output). Then shut down:

```bash
sudo poweroff
```

Repeat for `linux-amd64`. Note: the x86_64 image is emulated and boots slowly (~2-5 minutes).

### FreeBSD

FreeBSD is provisioned automatically via an `expect` script that drives the QEMU serial console:

```bash
./tools/ci64/setup-images.sh provision freebsd-arm64
```

This boots the VM, logs in as root, creates the `ci` user, installs packages, configures SSH and sudo, then shuts down. At the end it verifies SSH access works. The whole process takes 2-5 minutes.

If automated provisioning fails, you can fall back to interactive mode:

```bash
./tools/ci64/setup-images.sh provision-manual freebsd-arm64
# Log in as root (no password), then follow tools/ci64/provision/freebsd.sh
```

### NetBSD

```bash
./tools/ci64/setup-images.sh provision netbsd-arm64
```

Log in as `root` (no password), then:

```bash
# Create ci user
useradd -m -G wheel ci
echo 'ci' | passwd ci

# Install packages (set up pkgin first if needed)
export PKG_PATH="https://cdn.NetBSD.org/pub/pkgsrc/packages/NetBSD/evbarm-aarch64/10.1/All"
pkg_add pkgin
pkgin -y install cmake gcc12 libX11 libXext ncurses rsync

# Enable SSH
echo 'sshd=YES' >> /etc/rc.conf
/etc/rc.d/sshd start

shutdown -p now
```

## Step 3: Run CI builds

Run all platforms:

```bash
./tools/ci64/build-all.sh
```

Run specific platforms:

```bash
./tools/ci64/build-all.sh macos-native linux-arm64
```

Run VM builds in parallel (each uses a different SSH port):

```bash
./tools/ci64/build-all.sh --parallel
```

## Output

Build logs are saved to `tools/ci64/logs/<platform>.log`. At the end you'll see a summary:

```
=============================
=== CI Results (12m 34s) ===
=============================
  macos-native: PASS
  linux-arm64: PASS
  linux-amd64: PASS
  freebsd-arm64: PASS
  netbsd-arm64: PASS
=============================
ALL PASSED
```

## Troubleshooting

**"Disk image not found"** — Run `./tools/ci64/setup-images.sh` first.

**SSH connection refused** — The VM may still be booting. The script waits up to 120 seconds. If it still fails, try provisioning the image again.

**"sshpass: command not found"** — Install it: `brew install sshpass` (may need `brew install hudochenkov/sshpass/sshpass`).

**x86_64 build is very slow** — This is expected. Software emulation (TCG) runs at ~5-10x slower than native. Budget 10-20 minutes for x86_64.

**QEMU firmware not found** — Make sure QEMU is installed via Homebrew: `brew install qemu`. The EFI firmware is at `/opt/homebrew/share/qemu/edk2-aarch64-code.fd`.
