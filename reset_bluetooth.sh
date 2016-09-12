#!/bin/sh

# ToDo:
# Needs error handling for that rare possibility Bluetooth PLISTs
# don't exist and will exit 1 the whole script.

# Current user
loggedInUser=/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'\

# Remove Bluetooth PLISTs
cd /Library/Preferences/
#ls | grep com.apple.Bluetooth*
sudo rm -f com.apple.Bluetooth.plist

cd $loggedInUser/Library/Preferences/ByHost/
#ls | grep com.apple.Bluetooth*
#com.apple.Bluetooth.0116EA47-39C0-5A5F-A7C6-1E9F6B818086.plist
sudo rm -f com.apple.Bluetooth.*
#ls | grep com.apple.Bluetooth*

# Reboot
echo "Restarting now. Hit CTRL-C to cancel."
sleep 10s
sudo reboot
