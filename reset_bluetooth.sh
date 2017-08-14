#!/usr/bin/env bash


# Exit upon failed command
# set -e

# Logs
logTime=$(date +%Y-%m-%d:%H:%M:%S)
resetLog="/tmp/$(basename "$0" | cut -d. -f1)_$logTime.log"
exec &> >(tee -a "$resetLog")

# Current user
loggedInUser=$(stat -f%Su /dev/console)

# Working directory
scriptDir=$(cd "$(dirname "$0")" && pwd)

# Check for root privileges
if [[ "$(whoami)" != "root" ]]; then
    echo "Sorry, you need super user privileges to run this script."
    exit 1
fi

# PLISTs
declare -a plistsArray=(
    com.apple.Bluetooth.plist
    com.apple.driver.AppleBluetoothMultitouch.trackpad.plist
    com.apple.driver.AppleBluetoothMultitouch.mouse.plist
    com.apple.driver.AppleHIDMouse.plist
    com.apple.AppleMultitouchTrackpad.plist
    com.apple.preference.trackpad.plist
)
# echo $plistsArray

# Remove Bluetooth PLISTs
cd /Library/Preferences/ || exit
for f in "${plistsArray[@]}"; do
    echo "Removed $f."
    [[ -f "$f" ]] && rm -f "$f"
done

cd /Users/$loggedInUser/Library/Preferences/ByHost/ || exit
# e.g., com.apple.Bluetooth.0116EA47-39C0-5A5F-A7C6-1E9F6B818086.plist
rm -f com.apple.Bluetooth.*

# Reboot
read -r -p "Do you want to reboot now to finish installing updates? [Y/n]" response
response=${response,,} # tolower
    if [[ $response =~ ^(yes|y| ) ]]; then
        shutdown -r now
    fi
