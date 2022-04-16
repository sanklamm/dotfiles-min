#!/bin/bash

# copy this file to /usr/bin/reset_vega.sh
# This script must be run immediately after you shut down the VM. It doesn't work if the GPU has been left for too long
# following a shut down. It doesn't work if the VM is rebooted.
# to run simply open terminal and run: cat cat /usr/bin/reset_vega.sh
# Remove/Power off the Vega GPU like uninstalling devices in Windows device manager
echo “1” | sudo tee -a /sys/bus/pci/devices/0000:11:00.0/remove
echo “1” | sudo tee -a /sys/bus/pci/devices/0000:11:00.1/remove

# Suspend to RAM
systemctl suspend

# Read any user input
read input

# Change permisions of the PCI rescan command
sudo chmod 777 /sys/bus/pci/rescan

# Rescan PCI devices to reinitialise the vega GPU
sudo echo 1 > /sys/bus/pci/rescan

# This line is replaced by the last 2 because it throws invalid argument errors
# echo “1” | sudo tee -a /sys/bus/pci/rescan
