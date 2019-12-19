#!/usr/bin/env bash

# Check if homebrew is already installed. If not, install it.
if ! [ -x "$(command -v brew)" ]; then
  echo "Homebrew is not installed. Running installation now..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already installed..."
fi

# Make sure we are using the latest version.
echo "Updating brew... \n"
brew update

# Upgrade any formulae that are already installed.
echo "Upgrading previously installed kegs... \n"
brew upgrade

# Install everything listed in Brewfile
brew bundle

# Cleanup after ourself.
echo "Cleaning up after ourself... \n"
brew cleaup --force
rm -rf /Library/Caches/Homebrew/*

# Add GNU coreutils to our system $PATH
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

# Run .macos bootstrap script.
if [ "$(uname -s)" === Darwin ]; then
  echo "Running `source .macos`"
  source .macos
fi