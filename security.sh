#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Firewall                                                               
###############################################################################

# Enable
sudo defaults write /Library/Preferences/com.apple.alf globalstate -bool true
# Enable Logging
sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -bool true
# Enable Stealth Mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true
# Disable Automatically Signed Software to receiving Incoming Conn.
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool false

###############################################################################
# Network & DNS                                                            
###############################################################################

# Disable IPv6 for wireless
networksetup -setv6off Wi-Fi
echo "ipV6 off"

networksetup -setnetworkserviceenabled "Thunderbolt Bridge" off
networksetup -setnetworkserviceenabled "Bluetooth PAN" off
networksetup -setnetworkserviceenabled "Bluetooth DUN" off

#Disable Captive Portal
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false
echo "captive portal off"

#Spoof Mac Address
sudo ifconfig en0 ether $(openssl rand -hex 6 | sed 's%\(..\)%\1:%g; s%.$%%')
echo "mac address spoofed"

# YOSEMITE / EL CAPITAN SPECIFIC SETTINGS
if [[  $(sw_vers -productVersion | grep '10.[10-11]') ]]
then
sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState '0' > /dev/null 2>&1
sudo defaults write /Library/Preferences/com.apple.Bluetooth BluetoothAutoSeekKeyboard '0' > /dev/null 2>&1
sudo defaults write /Library/Preferences/com.apple.Bluetooth BluetoothAutoSeekPointingDevice '0' > /dev/null 2>&1
echo "BLUETOOTH IS DISABLED"
# DISABLE IDIOTIC SETTING 'DISPLAYS HAVE SEPERATE SPACES'
defaults write com.apple.spaces spans-displays -bool TRUE
fi
exit

