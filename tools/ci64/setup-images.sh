#!/bin/bash
# setup-images.sh — Download and provision VM disk images for CI
#
# One-time setup: downloads images, then provisions them with build deps
# and a ci user. Ubuntu auto-provisions via cloud-init, FreeBSD via expect
# script, NetBSD requires manual provisioning.
#
# Usage:
#   ./tools/ci64/setup-images.sh                        # Download all images
#   ./tools/ci64/setup-images.sh linux-arm64             # Download specific image
#   ./tools/ci64/setup-images.sh provision linux-arm64   # Provision (automated)
#   ./tools/ci64/setup-images.sh provision-manual freebsd-arm64  # Interactive fallback
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
IMAGES_DIR="$SCRIPT_DIR/images"
mkdir -p "$IMAGES_DIR"

# ─── Image download functions ──────────────────────────────────────────

download_ubuntu_arm64() {
    local img="$IMAGES_DIR/ubuntu-arm64.qcow2"
    if [ -f "$img" ]; then
        echo "Image already exists: $img"
        return 0
    fi
    echo "--- Downloading Ubuntu 24.04 ARM64 cloud image ---"
    curl -L -o "$img" \
        "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-arm64.img"

    # Resize to 20G to have room for build
    qemu-img resize "$img" 20G
    echo "Downloaded and resized: $img"
}

download_ubuntu_amd64() {
    local img="$IMAGES_DIR/ubuntu-amd64.qcow2"
    if [ -f "$img" ]; then
        echo "Image already exists: $img"
        return 0
    fi
    echo "--- Downloading Ubuntu 24.04 AMD64 cloud image ---"
    curl -L -o "$img" \
        "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"

    qemu-img resize "$img" 20G
    echo "Downloaded and resized: $img"
}

download_freebsd_arm64() {
    local img="$IMAGES_DIR/freebsd-arm64.qcow2"
    if [ -f "$img" ]; then
        echo "Image already exists: $img"
        return 0
    fi
    echo "--- Downloading FreeBSD 14.3 ARM64 VM image ---"
    local xz_file="$IMAGES_DIR/FreeBSD-14.3-RELEASE-arm64-aarch64.qcow2.xz"
    curl -L -o "$xz_file" \
        "https://download.freebsd.org/releases/VM-IMAGES/14.3-RELEASE/aarch64/Latest/FreeBSD-14.3-RELEASE-arm64-aarch64.qcow2.xz"
    echo "Decompressing..."
    xz -d "$xz_file"
    mv "$IMAGES_DIR/FreeBSD-14.3-RELEASE-arm64-aarch64.qcow2" "$img"

    qemu-img resize "$img" 20G
    echo "Downloaded and resized: $img"
}

download_netbsd_arm64() {
    local img="$IMAGES_DIR/netbsd-arm64.img"
    if [ -f "$img" ]; then
        echo "Image already exists: $img"
        return 0
    fi
    echo "--- Downloading NetBSD 10.1 ARM64 image ---"
    local gz_file="$IMAGES_DIR/netbsd-arm64.img.gz"
    curl -L -o "$gz_file" \
        "https://cdn.netbsd.org/pub/NetBSD/NetBSD-10.1/evbarm-aarch64/binary/gzimg/arm64.img.gz"
    echo "Decompressing..."
    gunzip "$gz_file"

    qemu-img resize "$img" 8G
    echo "Downloaded and resized: $img"
}

# ─── Cloud-init for Ubuntu images ──────────────────────────────────────

create_cloud_init_iso() {
    local iso="$IMAGES_DIR/cloud-init.iso"
    if [ -f "$iso" ]; then
        echo "Cloud-init ISO already exists: $iso"
        return 0
    fi

    local tmpdir
    tmpdir=$(mktemp -d)

    cat > "$tmpdir/meta-data" <<'METAEOF'
instance-id: ci-vm
local-hostname: ci-vm
METAEOF

    cat > "$tmpdir/user-data" <<'USEREOF'
#cloud-config
users:
  - name: ci
    plain_text_passwd: ci
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys: []

ssh_pwauth: true

package_update: true
packages:
  - cmake
  - g++
  - libx11-dev
  - libxext-dev
  - libncurses-dev
  - rsync

runcmd:
  - systemctl enable ssh
  - systemctl start ssh
USEREOF

    # Create ISO (macOS uses hdiutil, or mkisofs if available)
    if command -v mkisofs &>/dev/null; then
        mkisofs -output "$iso" -volid cidata -joliet -rock "$tmpdir/user-data" "$tmpdir/meta-data"
    elif command -v hdiutil &>/dev/null; then
        # macOS: use hdiutil to create a small ISO
        # First create a temporary directory structure
        mkdir -p "$tmpdir/iso_root"
        cp "$tmpdir/user-data" "$tmpdir/meta-data" "$tmpdir/iso_root/"
        hdiutil makehybrid -iso -joliet -iso-volume-name cidata -o "$iso" "$tmpdir/iso_root/"
        # hdiutil adds .iso extension if not present
        [ -f "${iso}.iso" ] && mv "${iso}.iso" "$iso"
    else
        echo "WARNING: Cannot create cloud-init ISO (no mkisofs or hdiutil)"
        echo "Install cdrtools: brew install cdrtools"
        rm -rf "$tmpdir"
        return 1
    fi

    rm -rf "$tmpdir"
    echo "Created cloud-init ISO: $iso"
}

# ─── SSH verification ─────────────────────────────────────────────────

verify_ssh() {
    local platform="$1"
    local img="$2"
    local ssh_port="$3"
    local qemu_cmd="$4"

    echo ""
    echo "--- Verifying SSH access (booting with -snapshot) ---"

    local pidfile monitor_sock
    pidfile=$(mktemp /tmp/qemu-verify-XXXXXX.pid)
    monitor_sock=$(mktemp /tmp/qemu-verify-XXXXXX.sock)

    # Boot with snapshot so we don't modify the provisioned image
    eval "$qemu_cmd \
        -pidfile $pidfile \
        -monitor unix:$monitor_sock,server,nowait" &

    local qemu_pid=$!

    # Poll SSH as ci/ci (up to 90 seconds)
    local ssh_ok=false
    for i in $(seq 1 45); do
        if sshpass -p ci ssh \
            -o StrictHostKeyChecking=no \
            -o UserKnownHostsFile=/dev/null \
            -o ConnectTimeout=5 \
            -o LogLevel=ERROR \
            -p "$ssh_port" ci@localhost "echo ready" 2>/dev/null; then
            ssh_ok=true
            break
        fi
        sleep 2
    done

    # Shut down the verification VM
    if [ -S "$monitor_sock" ]; then
        echo "system_powerdown" | socat - UNIX-CONNECT:"$monitor_sock" 2>/dev/null || true
        sleep 2
    fi
    if kill -0 "$qemu_pid" 2>/dev/null; then
        kill "$qemu_pid" 2>/dev/null || true
    fi
    rm -f "$pidfile" "$monitor_sock"

    if $ssh_ok; then
        echo "SSH verification PASSED — ci user can log in on $platform"
        return 0
    else
        echo "SSH verification FAILED — could not log in as ci on $platform"
        return 1
    fi
}

# ─── Provisioning mode ────────────────────────────────────────────────

provision_vm() {
    local platform="$1"
    echo ""
    echo "=== Provisioning: $platform ==="
    echo ""

    case "$platform" in
        linux-arm64)
            create_cloud_init_iso
            echo "Ubuntu cloud-init handles user creation and package install."
            echo "Booting with cloud-init ISO attached..."
            echo ""
            qemu-system-aarch64 \
                -machine virt -accel hvf -cpu host \
                -m 4G -smp 4 \
                -drive file="$IMAGES_DIR/ubuntu-arm64.qcow2",if=virtio \
                -drive file="$IMAGES_DIR/cloud-init.iso",if=virtio,media=cdrom \
                -bios /opt/homebrew/share/qemu/edk2-aarch64-code.fd \
                -nic user,hostfwd=tcp::2222-:22 \
                -nographic
            ;;
        linux-amd64)
            create_cloud_init_iso
            echo "Ubuntu cloud-init handles user creation and package install."
            echo "Booting with cloud-init ISO attached..."
            echo ""
            qemu-system-x86_64 \
                -machine q35 -cpu qemu64 \
                -m 4G -smp 2 \
                -drive file="$IMAGES_DIR/ubuntu-amd64.qcow2",if=virtio \
                -drive file="$IMAGES_DIR/cloud-init.iso",if=virtio,media=cdrom \
                -nic user,hostfwd=tcp::2223-:22 \
                -nographic
            ;;
        freebsd-arm64)
            local img="$IMAGES_DIR/freebsd-arm64.qcow2"
            if [ ! -f "$img" ]; then
                echo "ERROR: Disk image not found: $img"
                echo "Run ./tools/ci64/setup-images.sh freebsd-arm64 first."
                exit 1
            fi

            if ! command -v expect &>/dev/null; then
                echo "ERROR: 'expect' not found. On macOS it ships at /usr/bin/expect."
                exit 1
            fi

            echo "Automating FreeBSD provisioning via serial console..."
            echo "(This will boot the VM, create the ci user, install packages,"
            echo " configure SSH and sudo, then shut down.)"
            echo ""

            expect "$SCRIPT_DIR/provision/freebsd-console.exp" "$img"

            # Verify SSH works on the provisioned image
            local verify_qemu="qemu-system-aarch64 \
                -machine virt -accel hvf -cpu host \
                -m 4G -smp 4 \
                -drive file=$img,if=virtio,snapshot=on \
                -bios /opt/homebrew/share/qemu/edk2-aarch64-code.fd \
                -nic user,hostfwd=tcp::2224-:22 \
                -nographic"

            verify_ssh "$platform" "$img" 2224 "$verify_qemu"
            ;;
        netbsd-arm64)
            echo "NetBSD requires manual provisioning."
            echo ""
            echo "Log in as root (no password), then run:"
            echo "  useradd -m -G wheel ci"
            echo "  echo 'ci' | passwd ci"
            echo "  # See tools/ci64/provision/netbsd.sh for package install"
            echo ""
            qemu-system-aarch64 \
                -machine virt -accel hvf -cpu host \
                -m 2G -smp 2 \
                -drive file="$IMAGES_DIR/netbsd-arm64.img",if=virtio \
                -bios /opt/homebrew/share/qemu/edk2-aarch64-code.fd \
                -nic user,hostfwd=tcp::2225-:22 \
                -nographic
            ;;
        *)
            echo "ERROR: Unknown platform: $platform"
            exit 1
            ;;
    esac
}

# ─── Manual provisioning (interactive fallback) ──────────────────────

provision_vm_manual() {
    local platform="$1"
    echo ""
    echo "=== Manual provisioning: $platform ==="
    echo ""
    echo "This will boot the VM in interactive mode (no snapshot)."
    echo "Changes persist to the disk image."
    echo ""

    case "$platform" in
        freebsd-arm64)
            echo "FreeBSD default login: root (no password)"
            echo "See tools/ci64/provision/freebsd.sh for setup steps."
            echo ""
            qemu-system-aarch64 \
                -machine virt -accel hvf -cpu host \
                -m 4G -smp 4 \
                -drive file="$IMAGES_DIR/freebsd-arm64.qcow2",if=virtio \
                -bios /opt/homebrew/share/qemu/edk2-aarch64-code.fd \
                -nic user,hostfwd=tcp::2224-:22 \
                -nographic
            ;;
        netbsd-arm64)
            echo "NetBSD default login: root (no password)"
            echo "See tools/ci64/provision/netbsd.sh for setup steps."
            echo ""
            qemu-system-aarch64 \
                -machine virt -accel hvf -cpu host \
                -m 2G -smp 2 \
                -drive file="$IMAGES_DIR/netbsd-arm64.img",if=virtio \
                -bios /opt/homebrew/share/qemu/edk2-aarch64-code.fd \
                -nic user,hostfwd=tcp::2225-:22 \
                -nographic
            ;;
        *)
            echo "ERROR: provision-manual not needed for $platform"
            echo "(Ubuntu uses cloud-init, FreeBSD uses expect automation)"
            exit 1
            ;;
    esac
}

# ─── Main ─────────────────────────────────────────────────────────────

ALL_PLATFORMS=(linux-arm64 linux-amd64 freebsd-arm64 netbsd-arm64)

case "${1:-}" in
    provision)
        platform="${2:?Usage: setup-images.sh provision <platform>}"
        provision_vm "$platform"
        ;;
    provision-manual)
        platform="${2:?Usage: setup-images.sh provision-manual <platform>}"
        provision_vm_manual "$platform"
        ;;
    --help|-h)
        echo "Usage:"
        echo "  $0                                Download all VM images"
        echo "  $0 <platform>                     Download specific image"
        echo "  $0 provision <platform>            Provision VM (automated where possible)"
        echo "  $0 provision-manual <platform>     Boot VM for interactive provisioning"
        echo ""
        echo "Platforms: ${ALL_PLATFORMS[*]}"
        echo ""
        echo "After downloading, provision each image:"
        echo "  $0 provision linux-arm64    # Auto-provisions via cloud-init"
        echo "  $0 provision freebsd-arm64  # Auto-provisions via expect script"
        echo "  $0 provision netbsd-arm64   # Manual: create ci user, install pkgs"
        ;;
    "")
        echo "=== Downloading all VM images ==="
        echo "This may take a while on first run..."
        echo ""
        download_ubuntu_arm64
        download_ubuntu_amd64
        download_freebsd_arm64
        download_netbsd_arm64
        create_cloud_init_iso
        echo ""
        echo "=== All images downloaded ==="
        echo ""
        echo "Next: provision each image with build dependencies."
        echo "For Ubuntu images, cloud-init auto-provisions on first boot."
        echo ""
        echo "  $0 provision linux-arm64    # Auto-provisions via cloud-init"
        echo "  $0 provision linux-amd64    # Auto-provisions via cloud-init"
        echo "  $0 provision freebsd-arm64  # Auto-provisions via expect script"
        echo "  $0 provision netbsd-arm64   # Manual: create ci user, install pkgs"
        ;;
    *)
        platform="$1"
        case "$platform" in
            linux-arm64) download_ubuntu_arm64 ;;
            linux-amd64) download_ubuntu_amd64 ;;
            freebsd-arm64) download_freebsd_arm64 ;;
            netbsd-arm64) download_netbsd_arm64 ;;
            *)
                echo "ERROR: Unknown platform: $platform"
                echo "Known platforms: ${ALL_PLATFORMS[*]}"
                exit 1
                ;;
        esac
        ;;
esac
