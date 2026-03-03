#!/bin/sh
# provision/netbsd-i386.sh — Install build dependencies on NetBSD i386
# Run this inside the VM after first boot to prepare for CI builds.
#
# Note: jemalloc is required by vm/cmake/netbsd.cmake
set -eu

echo "--- Installing build dependencies ---"
sudo pkgin -y install \
    cmake \
    gcc12 \
    libX11 \
    libXext \
    ncurses \
    rsync \
    jemalloc

echo "--- Ensuring SSH is enabled ---"
if ! grep -q "^sshd=YES" /etc/rc.conf 2>/dev/null; then
    echo "sshd=YES" | sudo tee -a /etc/rc.conf
fi
sudo /etc/rc.d/sshd start 2>/dev/null || true

echo "--- Provisioning complete ---"
