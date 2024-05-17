#!/bin/bash

# Directory to store downloaded packages
DOWNLOAD_DIR="./packages"
mkdir -p $DOWNLOAD_DIR

# List of packages to download
PACKAGES=(
    "broadcom-sta-dkms"
    "dkms"
    "build-essential"
    "linux-headers-$(uname -r)"
    "libimobiledevice-utils"
    "ifuse"
    "usbmuxd"
    "libplist3"
    "libusbmuxd4"
)

# Update package list
sudo apt-get update

# Download packages and dependencies
for PACKAGE in "${PACKAGES[@]}"; do
    apt-get download $PACKAGE
done

# Move downloaded packages to USB
mv *.deb $DOWNLOAD_DIR

echo "Packages downloaded to $DOWNLOAD_DIR"
