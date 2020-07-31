#!/bin/bash

# configure zsh
# first install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# then install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# configure nvim
ln -s /home/$USER/.vim /home/$USER/.config/nvim
ln -s /home/$USER/.vimrc /home/$USER/.config/nvim/init.vim

mkdir -p ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# delete unecessary dotfiles
rm ~/.README.md
rm ~/.Screenshot-1.png
rm ~/.Screenshot-2.png
rm ~/.LICENSE
rm ~/.install.sh
