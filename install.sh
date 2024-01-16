#!/bin/bash

# configure zsh
# first install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# and enable italics to terminal
tic -x xterm-256color-italic.terminfo
# test if it worked!
echo -e "\033[1mbold\033[0m\n\033[3mitalic\033[0m\n\033[4munderline\033[0m\n\033[4:3mUndercurled\033[0m\n\033[9mstrikethrough\033[0m"

# stow dotfiles
stow cowsay
stow dbcli
stow fonts
stow fortunes
stow git
stow keyledsd
stow kitty
stow neofetch
stow nvim
stow tmux
stow vim
stow zsh

# set up fonts
fc-cache

# setup tmux plugins
TMUX_PLUGINS="${HOME}/.tmux/plugins"
[ ! -d $TMUX_PLUGINS ] && mkdir -p "${TMUX_PLUGINS}" && git clone https://github.com/tmux-plugins/tpm "${TMUX_PLUGINS}/tpm"
