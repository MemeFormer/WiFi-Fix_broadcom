#!/bin/bash

# Directory where packages are stored
PACKAGE_DIR="/path/to/usb/packages"

# Install packages
sudo dpkg -i $PACKAGE_DIR/*.deb

# Load the Broadcom module
sudo modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
sudo modprobe wl

# Restart networking services
sudo service network-manager restart

echo "Broadcom WiFi and iPhone tethering setup completed."
