#!/bin/bash

# Update package list and upgrade existing packages
sudo apt update && sudo apt upgrade -y

# Install zsh, bat, exa, zoxide, fzf
sudo apt install zsh bat exa zoxide fzf -y

# Check if cargo is installed, if not install it
if ! command -v cargo &> /dev/null
then
    echo "cargo not found, installing..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    # Add cargo to PATH
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Ask user if they want to install tealdeer
read -p "Do you want to install tealdeer (tldr)? (y/n): " choice
case "$choice" in
  y|Y ) 
    # Install tealdeer with cargo
    echo "Installing tealdeer..."
    cargo install tealdeer
    ;;
  n|N ) ;;
  * ) echo "Invalid choice, skipping tealdeer installation.";;
esac

# Ask user if they want to install pyenv
read -p "Do you want to install pyenv? (y/n): " choice
case "$choice" in
  y|Y ) 
    # Install pyenv dependencies
    sudo apt install build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

    # Install pyenv
    curl https://pyenv.run | bash

    # Add pyenv to PATH
    export PATH="$HOME/.pyenv/bin:$PATH"

    # Install pyenv plugin for Zsh
    zinit wait"!0" lucid svn for OMZ::plugins/pyenv
    zinit light "chrissicool/zsh-256color"
  ;;
  n|N ) ;;
  * ) echo "Invalid choice, skipping pyenv installation.";;
esac

# Create a symlink for bat, if necessary
if [ ! -f ~/.local/bin/bat ] && [ -f /usr/bin/batcat ]; then
    echo "Creating symlink for bat..."
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
fi

# Reminder to reload the shell
echo "Installation complete! Please reload your shell to start using zsh."

