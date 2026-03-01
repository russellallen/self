#!/bin/bash
# build-vm.sh — Boot a QEMU VM, rsync source, build vm64, report result
#
# Usage: ./tools/ci64/build-vm.sh <platform>
#   e.g.: ./tools/ci64/build-vm.sh linux-arm64
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

PLATFORM="${1:?Usage: build-vm.sh <platform>}"
CONF="$SCRIPT_DIR/configs/${PLATFORM}.conf"

if [ ! -f "$CONF" ]; then
    echo "ERROR: No config found at $CONF"
    exit 1
fi

# Load platform config
# shellcheck source=/dev/null
source "$CONF"

# Config must define:
#   QEMU_CMD        — full qemu-system-* command (without -pidfile/-monitor)
#   SSH_PORT        — host port forwarded to guest :22
#   SSH_USER        — username for SSH
#   SSH_PASS        — password (used via sshpass, or use key-based auth)
#   DISK_IMAGE      — path to disk image (relative to SCRIPT_DIR)
#   CMAKE_FLAGS     — extra cmake flags for this platform
#   NPROC_CMD       — command to get CPU count inside guest (e.g. "nproc" or "sysctl -n hw.ncpu")

DISK_IMAGE_PATH="$SCRIPT_DIR/$DISK_IMAGE"
if [ ! -f "$DISK_IMAGE_PATH" ]; then
    echo "ERROR: Disk image not found: $DISK_IMAGE_PATH"
    echo "Run ./tools/ci64/setup-images.sh first."
    exit 1
fi

# SSH options common to all connections
SSH_OPTS="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ConnectTimeout=5 -o LogLevel=ERROR"
SSH_CMD="sshpass -p $SSH_PASS ssh $SSH_OPTS -p $SSH_PORT ${SSH_USER}@localhost"
SCP_CMD="sshpass -p $SSH_PASS scp $SSH_OPTS -P $SSH_PORT"
RSYNC_SSH="sshpass -p $SSH_PASS ssh $SSH_OPTS -p $SSH_PORT"

PIDFILE=$(mktemp /tmp/qemu-ci-XXXXXX.pid)
MONITOR_SOCK=$(mktemp /tmp/qemu-ci-XXXXXX.sock)
trap 'cleanup' EXIT

cleanup() {
    echo "--- Cleaning up VM for $PLATFORM ---"
    # Try graceful shutdown first
    if [ -S "$MONITOR_SOCK" ]; then
        echo "system_powerdown" | socat - UNIX-CONNECT:"$MONITOR_SOCK" 2>/dev/null || true
        sleep 2
    fi
    # Force kill if still running
    if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        kill "$(cat "$PIDFILE")" 2>/dev/null || true
    fi
    rm -f "$PIDFILE" "$MONITOR_SOCK"
}

echo "=== Building $PLATFORM ==="
echo "Disk image: $DISK_IMAGE_PATH"
echo "SSH port: $SSH_PORT"

# Start QEMU in background with monitor socket for clean shutdown
echo "--- Starting VM ---"
eval "$QEMU_CMD \
    -pidfile $PIDFILE \
    -monitor unix:$MONITOR_SOCK,server,nowait" &

QEMU_PID=$!

# Wait for SSH to become available (up to 120 seconds)
echo "--- Waiting for SSH ---"
SSH_READY=false
for i in $(seq 1 60); do
    if $SSH_CMD "echo ready" 2>/dev/null; then
        SSH_READY=true
        break
    fi
    sleep 2
done

if ! $SSH_READY; then
    echo "ERROR: SSH not available after 120 seconds"
    exit 1
fi

echo "--- SSH ready, syncing source ---"

# Create target directory
$SSH_CMD "mkdir -p /tmp/self-build" 2>/dev/null

# rsync source tree (exclude build dirs, images, .git)
rsync -azL --delete \
    -e "$RSYNC_SSH" \
    --exclude='build-*/' \
    --exclude='build/' \
    --exclude='.git/worktrees/' \
    --exclude='tools/ci64/images/' \
    --exclude='tools/ci64/logs/' \
    --exclude='*.o' \
    --exclude='*.snap' \
    "$PROJECT_ROOT/" \
    "${SSH_USER}@localhost:/tmp/self-build/"

echo "--- Building vm64 ---"

# Run cmake and build inside VM
BUILD_RESULT=0
$SSH_CMD "cd /tmp/self-build && \
    cmake -S vm64 -B build -DCMAKE_BUILD_TYPE=Release $CMAKE_FLAGS && \
    rm -f build/incls/_precompiled.hh.gch && \
    cmake --build build -j\$($NPROC_CMD)" || BUILD_RESULT=$?

if [ $BUILD_RESULT -eq 0 ]; then
    echo "=== $PLATFORM: BUILD SUCCEEDED ==="
else
    echo "=== $PLATFORM: BUILD FAILED (exit code $BUILD_RESULT) ==="
fi

# Shut down VM (trap will handle cleanup)
exit $BUILD_RESULT
