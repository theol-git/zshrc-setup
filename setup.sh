#!/bin/bash

# Update package list and upgrade existing packages
sudo apt update && sudo apt upgrade -y && sudo apt install build-essential subversion -y


# Install zsh, bat, exa, zoxide, fzf
sudo apt install zsh bat exa zoxide fzf -y

# Set zsh as the default shell
sudo chsh -s $(which zsh) $USER

# Ask user if they want to install tealdeer
read -p "Do you want to install tealdeer (tldr)? (y/n): " choice
case "$choice" in
  y|Y ) 
    # Check if cargo is installed, if not install it
    if ! command -v cargo &> /dev/null
    then
        echo "cargo not found, installing..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        # Add cargo to PATH
        export PATH="$HOME/.cargo/bin:$PATH"
    fi
    # Install tealdeer with cargo
    echo "Installing tealdeer..."
    cargo install tealdeer
    tldr --update
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
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python3-venv -y

    # Install pyenv
    curl https://pyenv.run | bash
  ;;
  n|N ) ;;
  * ) echo "Invalid choice, skipping pyenv installation.";;
esac

# Create a symlink for bat, if necessary
if [ ! -f ~/.local/bin/bat ] && [ -f /usr/bin/batcat ]; then
    echo "Creating symlink for bat..."
    sudo ln -s /usr/bin/batcat /usr/local/bin/bat
fi

# Check if .zshrc already exists and create a backup if it does
if [ -f "$HOME/.zshrc" ]; then
    # Create a backup directory if it doesn't exist
    mkdir -p "$HOME/.zshrc_backups"

    # Create a backup with date/time in the file name
    cp "$HOME/.zshrc" "$HOME/.zshrc_backups/.zshrc.backup.$(date +"%Y%m%d-%H%M%S")"
fi


# Create a symbolic link to .zshrc in the home directory
ln -sf "$PWD/.zshrc" "$HOME/.zshrc"

# Prompt user to install a font compatible with Powerlevel10k
read -p "Before continuing, please install a font compatible with Powerlevel10k, I enjoy the jetbrains-mono font from this repo: https://github.com/ryanoasis/nerd-fonts. Press Enter to continue."


# Reminder to reload the shell
echo "Installation complete! Please reload your shell to start using zsh."

