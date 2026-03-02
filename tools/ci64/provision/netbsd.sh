#!/bin/sh
# provision/netbsd.sh — Install build dependencies on NetBSD
# Run this inside the VM after first boot to prepare for CI builds.
set -eu

echo "--- Installing build dependencies ---"
sudo pkgin -y install \
    cmake \
    gcc12 \
    libX11 \
    libXext \
    ncurses \
    rsync

echo "--- Ensuring SSH is enabled ---"
if ! grep -q "^sshd=YES" /etc/rc.conf 2>/dev/null; then
    echo "sshd=YES" | sudo tee -a /etc/rc.conf
fi
sudo /etc/rc.d/sshd start 2>/dev/null || true

echo "--- Provisioning complete ---"
