# Zshrc Setup

This repository contains a bash script and a Zsh configuration file that can be used to set up a new Linux machine with a customized Zsh shell environment.

The script installs Zsh, along with several useful plugins and command-line tools such as bat, exa, zoxide, fzf, and pyenv. It also provides the option to install tealdeer (tldr), a command-line utility for quickly getting concise, practical help for commands, and sets up the powerlevel10k theme for Zsh.

## Installation

To use this setup, follow these steps:

1. Clone this repository to your home directory and navigate to the repository:

   ```bash
   cd ~
   git clone https://github.com/theol-git/zshrc-setup.git .zshrc-repo
   cd .zshrc-repo
   ```

2. Make the `setup.sh` script executable:

   ```bash
   chmod +x setup.sh
   ```

3. Run the `setup.sh` script:

   ```bash
   ./setup.sh
   ```

   This will install Zsh and the necessary plugins and command-line tools, and configure the shell environment.

4. Reload your shell:

   ```bash
   source ~/.zshrc
   ```

   This will apply the new configuration and make the changes take effect in your current shell session.

## Customization

If you want to customize your Zsh configuration further, you can edit the `.zshrc` file in the `.zshrc-repo` directory. This file is loaded by Zsh when you start a new shell session, and you can add or remove plugins, aliases, and other settings as needed.

## Credits

This setup was inspired by various Zsh configuration examples and tutorials available online. Some of the key resources used include:

- [oh-my-zsh](https://ohmyz.sh/)
- [zdharma/zinit](https://github.com/zdharma/zinit)
- [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [sharkdp/bat](https://github.com/sharkdp/bat)
- [ogham/exa](https://github.com/ogham/exa)
- [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide)
- [junegunn/fzf](https://github.com/junegunn/fzf)

## License

This project is licensed under the [MIT License](LICENSE).
