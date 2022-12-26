#!/bin/bash

# configure zsh
# first install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# then install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# set up fonts
fc-cache

# and enable italics to terminal
tic xterm-256color-italic.terminfo
# test if it worked!
echo -e "\e[1mbold\e[0m\n\e[3mitalic\e[0m\n\e[4munderline\e[0m\n\e[9mstrikethrough\e[0m"

# delete unecessary dotfiles
rm ~/.README.md
rm ~/.Screenshot-1.png
rm ~/.Screenshot-2.png
rm ~/.LICENSE
rm ~/.install.sh
rm ~/.xterm-256color-italic.terminfo

# setup tmux plugins
mkdir -p ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#
# configure nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
