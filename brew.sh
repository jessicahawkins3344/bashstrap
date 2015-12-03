#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
#brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install -v --with-fpm --with-mysql --disable-opcache php56

ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents

brew install php56-http
brew install php56-mcrypt
brew install php56-memcache
brew install php56-memcached
brew install php56-mongo
brew install php56-opcache
brew install php56-propro
brew install php56-raphf
brew install php56-tidy
brew install php56-xdebug

brew install jenv
brew install ruby
brew install node
brew install python3

npm install -g bower
npm install -g phantomjs
npm install -g yo
npm install -g less
npm install -g grunt-cli
npm install -g gulp
npm install -g coffee-script

# Update git version
brew install git
brew unlink git && brew link git
brew info git
brew install git-extra
brew install git bash-completion2

# Other useful binaries
brew install rename
brew install tree


# Remove outdated versions from the cellar.
brew cleanup