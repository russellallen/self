#!/bin/bash
# provision/linux.sh — Install build dependencies on Ubuntu/Debian
# Run this inside the VM after first boot to prepare for CI builds.
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

echo "--- Updating package lists ---"
sudo apt-get update -qq

echo "--- Installing build dependencies ---"
sudo apt-get install -y -qq \
    cmake \
    g++ \
    libx11-dev \
    libxext-dev \
    libncurses-dev \
    rsync \
    openssh-server

echo "--- Ensuring SSH is enabled ---"
sudo systemctl enable ssh
sudo systemctl start ssh

echo "--- Provisioning complete ---"
