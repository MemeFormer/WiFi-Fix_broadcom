## Overview

This repository provides scripts to facilitate the installation of necessary packages on a device without an internet connection. The scripts are designed to download the required packages on a machine with internet access, save them to a USB drive, and then install them on the target machine. This process is particularly useful for setting up Broadcom WiFi and potentially iPhone USB tethering.

## Scripts

The repository contains three scripts:

1. `download_packages.sh`: This script downloads the necessary packages and their dependencies and saves them in a directory named "packages".

2. `install_packages.sh`: This script installs the downloaded packages on the target machine. It also includes steps to blacklist conflicting Broadcom drivers.

3. `install_packages_noblcklst.sh`: This is the original version of the installation script, which does not include the blacklisting of conflicting Broadcom drivers.

## Usage

Follow these steps to use the scripts:

1. Run the `download_packages.sh` script on a machine with internet access to download the necessary packages.
2. Transfer the `install_packages.sh` script and the downloaded packages to your USB drive.
3. On the target machine (e.g., MacBook), plug in the USB drive and navigate to the location where you've copied the files.
4. Run the `install_packages.sh` script.

## Troubleshooting

If you encounter any issues during the process, you can use the following commands to diagnose the problem:

- Check dmesg Logs:

```bash
dmesg | grep -i 'broadcom\|wl\|usb'
```

- Verify Network Interfaces:

```bash
ip link show
```

Please provide the output of these commands or any other relevant logs or error messages you encounter during the process. This information will help diagnose any remaining issues.

## Note

The `install_packages.sh` script includes steps to blacklist conflicting Broadcom drivers. This is necessary if you have previously installed a different Broadcom driver. If you have not installed a different driver, you can use the `install_packages_noblcklst.sh` script, which does not include the blacklisting steps.

## Conclusion

By following these steps, you should be able to download the necessary packages on a machine with internet access, transfer them via USB, and install them on your target machine. This should help in getting both your Broadcom WiFi and iPhone USB tethering working. If problems persist, please provide the output of the `lspci` command so we can confirm the exact packages needed for your Broadcom device. If the Broadcom WiFi or iPhone tethering still doesn't work, please provide the output of `dmesg | grep -i 'broadcom\|wl\|usb'` and any other relevant logs or error messages you encounter during the process. This information will help diagnose any remaining issues. If problems persist with the USB/SD card, consider replacing it to avoid ongoing reliability issues.
