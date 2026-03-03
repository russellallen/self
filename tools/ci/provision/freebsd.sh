#!/bin/sh
# provision/freebsd.sh — Full provisioning for FreeBSD CI VM
#
# Run this inside the VM as root to prepare for CI builds.
# Creates the ci user, installs packages, and configures SSH + sudo.
#
# The expect script (freebsd-console.exp) automates running these steps,
# but this script is kept as a reference and for manual use.
set -eu

echo "--- Creating ci user ---"
if ! pw usershow ci >/dev/null 2>&1; then
    pw useradd ci -m -s /bin/sh -G wheel
    echo 'ci' | pw usermod ci -h 0
    echo "Created user ci"
else
    echo "User ci already exists"
fi

echo "--- Configuring SSH ---"
sed -i '' 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i '' 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sysrc sshd_enable=YES
service sshd restart 2>/dev/null || service sshd start 2>/dev/null || true

echo "--- Installing build dependencies ---"
env ASSUME_ALWAYS_YES=yes pkg install -y \
    cmake \
    gcc \
    libX11 \
    libXext \
    ncurses \
    rsync \
    sudo

echo "--- Configuring sudo ---"
if ! grep -q '^ci ALL' /usr/local/etc/sudoers 2>/dev/null; then
    echo 'ci ALL=(ALL) NOPASSWD: ALL' >> /usr/local/etc/sudoers
    echo "Added ci to sudoers"
else
    echo "ci already in sudoers"
fi

echo "--- Provisioning complete ---"
echo "You can now shut down: poweroff"
