#!/bin/sh

echo "Setting up your new Mac Home..."

# Uninstall and Install xcode tools
softwareupdate --all --install --force
sudo xcode-select --install

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make BASH the default shell environment
chsh -s $(which bash)

# Set Git Credentials
git config --global user.name "BrennnanPredmore"
git config --global user.email "brennnann@gmail.com"

# Install global NPM packages
npm install --global lite-server

# Create the dotfiles
./makesymlinks.sh
