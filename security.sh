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

brew install dnsmasq

mkdir -p /usr/local/etc
cp /usr/local/opt/dnsmasq/dnsmasq.conf.example /usr/local/etc/dnsmasq.conf
vim /usr/local/etc/dnsmasq.conf

#Install and start program
sudo cp -fv /usr/local/opt/dnsmasq/*.plist /Library/LaunchDaemons
sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

#Set DNS Server
sudo networksetup -setdnsservers "Wi-Fi" 127.0.0.1

#Disable Captive Portal
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

#Spoof Mac Address
sudo ifconfig en0 ether $(openssl rand -hex 6 | sed 's%\(..\)%\1:%g; s%.$%%')


###############################################################################
# OpenSSL & Curl                                                           
###############################################################################

brew install openssl
brew install curl --with-openssl
brew link --force curl
brew link --force openssl



