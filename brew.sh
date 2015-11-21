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
<<<<<<< HEAD
ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents

# Install PHP extensions
brew install php56-http
=======

ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents

brew install php56-http
brew install php56-mcrypt
>>>>>>> 382682fd91c7f5acbea72a7eeaedb046ff1b0218
brew install php56-memcache
brew install php56-memcached
brew install php56-mongo
brew install php56-opcache
<<<<<<< HEAD
brew install php56-tidy
brew install php56-xdebug

# Add launch agent for memcached
ln -sfv /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents

brew install node

# Installing updated Git
=======
brew install php56-propro
brew install php56-raphf
brew install php56-tidy
brew install php56-xdebug

brew install jenv
brew install ruby
brew install node

npm install -g bower
npm install -g phantomjs
npm install -g yo
npm install -g less
npm install -g grunt-cli
npm install -g gulp
npm install -g coffee-script

# Update git version
>>>>>>> 382682fd91c7f5acbea72a7eeaedb046ff1b0218
brew install git
brew unlink git && brew link git
brew info git
brew install git-extra
brew install git bash-completion2

<<<<<<< HEAD
# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install bfg
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
#brew install nmap
#brew install pngcheck
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf
#brew install xz

# Install other useful binaries.
brew install rename
brew install tree
#brew install ack
#brew install dark-mode
#brew install exiv2
#brew install git-lfs
#brew install imagemagick --with-webp
#brew install lynx
#brew install p7zip
#brew install pigz
#brew install pv
#brew install rename
#brew install rhino
#brew install speedtest_cli
#brew install ssh-copy-id
#brew install webkit2png
#brew install zopfli
=======
# Other useful binaries
brew install rename
brew install tree

>>>>>>> 382682fd91c7f5acbea72a7eeaedb046ff1b0218

# DNSmasq
brew install dnsmasq
mkdir -p /usr/local/etc
cp /usr/local/opt/dnsmasq/dnsmasq.conf.example /usr/local/etc/dnsmasq.conf
subl /usr/local/etc/dnsmasq.conf

sudo networksetup -setdnsservers "Wi-Fi" 127.0.0.1

#Open SSL
brew install openssl
brew link openssl

# Remove outdated versions from the cellar.
brew cleanup
