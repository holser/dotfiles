#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
if [ ! -f /usr/local/bin/brew ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade

# Install command-line tools using Homebrew.
brew install ansible
brew install aria2
brew install arping
brew install aspell
brew install bash
brew install binwalk
brew install coreutils
brew install ctags
brew install curl
brew install findutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install gawk
brew install git
brew install git-review
brew install gnu-sed
brew install grep
brew install gpg
brew install htop
brew install jq
brew install mas
brew install moreutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install mtr
brew install nmap
brew install openssl
brew install p7zip
brew install pv
brew install python
brew install python@2
brew install reattach-to-user-namespace
brew install rsync
brew install ssh-copy-id
brew install tmate
brew install tmux
brew install unrar
brew install vagrant-completion
brew install vim
brew install watch
brew install wget --enable-iri
brew install xz
brew cleanup

brew cask install adguard
brew cask install adobe-acrobat-reader
brew cask install adobe-air
brew cask install aerial
brew cask install blue-jeans
brew cask install chromium
brew cask install garmin-express
brew cask install gimp
brew cask install hazel
brew cask install highsierramediakeyenabler
brew cask install iterm2
brew cask install jollysfastvnc
brew cask install little-snitch
brew cask install mpv
brew cask install vagrant
brew cask install virtualbox
brew cask install viscosity
brew cask install xld
brew cask install xquartz
brew cask cleanup

mas install 747648890  # Telegram
mas install 443987910  # 1Password
mas install 1262957439 # Textual 7
mas install 803453959  # Slack

# Python
pip3 install --upgrade pip setuptools virtualenv
pip3 install jedi
