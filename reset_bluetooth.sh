#!/bin/sh

# ToDo:
# Needs error handling for that rare possibility Bluetooth PLISTs
# don't exist and will exit 1 the whole script.

# Current user
loggedInUser=$(ls -l /dev/console | cut -d " " -f 4)

# Logging
logTime=$(date +%Y-%m-%d:%H:%M:%S)
resetLog="/tmp/resetLog_$logTime.log"
exec 1>>$resetLog
# Redirect STDERR to STDOUT
exec 2>&1

# Check for root privileges
if [ $(whoami) != "root" ]; then
    echo "Sorry, you need super user privileges to run this script."
    exit 1
fi

# Remove Bluetooth PLISTs
cd /Library/Preferences/
#ls | grep com.apple.Bluetooth*
sudo rm -f com.apple.Bluetooth.plist
sudo rm -f com.apple.driver.AppleBluetoothMultitouch.trackpad.plist
sudo rm -f com.apple.driver.AppleBluetoothMultitouch.mouse.plist
sudo rm -f com.apple.driver.AppleHIDMouse.plist
sudo rm -f com.apple.AppleMultitouchTrackpad.plist
sudo rm -f com.apple.preference.trackpad.plist

cd $loggedInUser/Library/Preferences/ByHost/
#ls | grep com.apple.Bluetooth*
#com.apple.Bluetooth.0116EA47-39C0-5A5F-A7C6-1E9F6B818086.plist
sudo rm -f com.apple.Bluetooth.*
#ls | grep com.apple.Bluetooth*

# Reboot
echo "Restarting now. Hit CTRL-C to cancel."
sleep 5s
sudo reboot
