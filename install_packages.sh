#!/bin/bash

# Directory where packages are stored
PACKAGE_DIR="/media/kali/31.86GB/packages"

# Install packages
sudo dpkg -i $PACKAGE_DIR/*.deb

# Blacklist conflicting Broadcom drivers
echo "blacklisting conflicting Broadcom drivers..."
cat <<EOL | sudo tee /etc/modprobe.d/blacklist-broadcom.conf
blacklist b44
blacklist b43
blacklist b43legacy
blacklist ssb
blacklist brcmsmac
blacklist bcma
EOL

# Load the Broadcom wl driver
sudo modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
sudo modprobe wl

# Restart networking services
sudo service network-manager restart

echo "Broadcom WiFi and iPhone tethering setup completed."
