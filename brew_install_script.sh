#!/bin/sh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

echo "Installing brew..."
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/simonwallinherlofsson/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/simonwallinherlofsson/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing brew cask..."
# brew tap homebrew/cask

# Programming Languages
echo "Installing programming languages..."
brew install rust


# Dev Tools
echo "Installing development tools..."
brew install git
brew install --cask github
brew install --cask visual-studio-code
brew install --cask openlens
brew install --cask iterm2
brew install minikube

# Communication Apps
echo "Installing communication apps..."
brew install --cask discord
brew install --cask zoom

# Web Tools
echo "Installing web tools..."
brew install node
brew install nvm

# File Storage
echo "Installing file storage tools..."

# Writing Apps
echo "Installing writing apps..."
brew install --cask obsidian

# Other
echo "Installing everything else..."
brew install --cask steam
brew install --cask vlc
# brew install --cask tor-browser
brew install --cask google-chrome

# Additional installs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
