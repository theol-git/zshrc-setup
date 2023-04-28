#
# zinit
#

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone git://github.com:zdharma-continuum/zinit.git "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#
# end of zinit
#

# Check if ~/.pyenv directory exists
if [[ -d $HOME/.pyenv ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

# load pyenv
zinit wait"!0" lucid svn for OMZ::plugins/pyenv

zinit light "chrissicool/zsh-256color"

# Load specified list of plugins
zinit svn for \
    OMZ::plugins/git \
    OMZ::plugins/sudo \
    OMZ::plugins/dirhistory \
    OMZ::plugins/jsontools \
    OMZ::plugins/virtualenv \
    OMZ::plugins/colored-man-pages \
    OMZ::plugins/command-not-found \
    OMZ::plugins/python

zinit light zdharma-continuum/history-search-multi-word

# load syntax highlight, autosuggest
# async without delay
zinit wait lucid for \
atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions

# Install and load powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# z jump
unalias zi
eval "$(zoxide init zsh)"

# aliases
alias cat='bat'
alias ls='exa'
alias la='exa -la'
alias cd='z'

# allow for prefix history search
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Bind Ctrl+Backspace and Ctrl+Delete to delete words
bindkey "^[[3;5~" kill-word
bindkey "^H" backward-kill-word
