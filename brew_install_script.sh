#!/bin/sh

# Check if homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo >> /Users/simonwallinherlofsson/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/simonwallinherlofsson/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Home brew is already installed"
fi

apps=()
casks=()

# Programming Languages
apps+=("rust" "dotnet")
casks+=()

# Dev Tools
apps+=("git" "minikube")
casks+=("github" "visual-studio-code" "openlens" "iterm2" "rider")

# Communication Apps
apps+=()
casks+=("discord" "zoom")

# Web Tools
apps+=("node" "nvm" "yarn")
casks+=()

# File Storage
apps+=()
casks+=()

# Writing Apps
apps+=()
casks+=("obsidian")

# SVS Tools
# Backstage development
apps+=("sops" "age" "yq")

# Other
apps+=(wget)
casks+=("steam" "vlc" "google-chrome") # tor-browser

# Additional installs
apps+=()
casks+=()

if [ -d "$HOME/.oh-my-zsh" ]; then 
    echo "Oh My Zsh is already installed."
else
    echo "Oh My Zsh is not installed. Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Function to check if a regular application is installed
is_installed() {
    brew list $1 &> /dev/null
}

# Function to check if a cask application is installed
is_cask_installed() {
    brew list --cask $1 &> /dev/null
}

# Function to check if an application is installed
check_and_install() {
    if ! $2 $1; then
        echo "$1 is not installed. Installing..."
        if [ "$2" == "is_cask_installed" ]; then
            brew install --cask $1
        else
            brew install $1
        fi
    else
        echo "$1 is already installed."
    fi
}

# Loop through the list of applications
for app in "${apps[@]}"; do
    check_and_install $app "is_installed"
done
for cask in "${casks[@]}"; do
    check_and_install $cask "is_cask_installed" --cask 
done