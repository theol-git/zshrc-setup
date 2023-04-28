# Zshrc Setup

This repository contains a bash script and a Zsh configuration file that can be used to set up a new Linux machine with a customized Zsh shell environment.

The script installs Zsh, along with several useful plugins and command-line tools such as bat, exa, zoxide, fzf, and pyenv. It also provides the option to install tealdeer (tldr), a command-line utility for quickly getting concise, practical help for commands, and sets up the powerlevel10k theme for Zsh.

## Installation

To use this setup, follow these steps:

```bash
cd ~
git clone https://github.com/theol-git/zshrc-setup.git .zshrc-repo
cd .zshrc-repo
chmod +x setup.sh
# install Zsh, plugins and command-line tools then configure the shell environment.
./setup.sh
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
