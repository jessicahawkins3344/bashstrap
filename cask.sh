#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew tap caskroom/versions
brew cask install sublime-text3
brew cask install iterm2
brew cask install google-chrome
brew cask install appcleaner
brew cask install atom
brew cask install java