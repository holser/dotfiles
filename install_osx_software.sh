#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
if [ ! -f /usr/local/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade

# Install command-line tools using Homebrew.
brew install 1password-cli
brew install ansible
brew install aria2
brew install arping
brew install aspell
brew install autopep8
brew install bash
brew install binwalk
brew install coreutils
brew install ctags
brew install curl
brew install findutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install flake8
brew install gawk
brew install gdrive
brew install git
brew install git-review
brew install gnu-sed
brew install golang
brew install gpg
brew install grep
brew install htop
brew install jq
brew install mas
brew install moreutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install mtr
brew install nmap
brew install nvim
brew install openshift-cli
brew install openssl
brew install openstackclient
brew install p7zip
brew install pipx
brew install pv
brew install pyenv
brew install pyenv-virtualenv
brew install pylint
brew install python
brew install reattach-to-user-namespace
brew install rsync
brew install ssh-copy-id
brew install tmate
brew install tmux
brew install tree
brew install watch
brew install wget
brew install xz


brew install --cask 1password
brew install --cask adguard
brew install --cask aerial
brew install --cask brave-browser
brew install --cask google-drive
brew install --cask hazel
brew install --cask iina
brew install --cask jollysfastvnc
brew install --cask little-snitch
brew install --cask viscosity
brew install --cask visual-studio-code
brew install --cask xld
brew install --cask xquartz
brew install --cask zoom

brew tap homebrew/cask-fonts
brew install font-sf-mono # A font for iTerm

brew cleanup

mas install 747648890  # Telegram
mas install 1262957439 # Textual 7
mas install 803453959  # Slack
mas install 1569813296 # 1Password for Safari
mas install 904280696  # Things

# Python
pip3 install --upgrade pip setuptools virtualenv
pip3 install jedi

# Setup SSL root cert used by RHOS Prod Chain
cd ~/Downloads
curl -sSL -O https://password.corp.redhat.com/pki-ca-chain.crt
sudo security add-trusted-cert -d -r trustAsRoot -k "/Library/Keychains/System.keychain" pki-ca-chain.crt
