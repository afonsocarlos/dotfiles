#!/bin/bash

set -e
# set -x

# function install {
#   which $1 &> /dev/null
#
#   if [ $? -ne 0 ]; then
#     echo "Installing: ${1}..."
#     sudo apt install -y $1
#   else
#     echo "Already installed: ${1}"
#   fi
# }

# check if on debian like distros if not skip the script
if [ -x "$(command -v apt)" ]; then

  sudo apt update && sudo apt upgrade -y

  echo "Installing essential build tools..."
  sudo apt-get install -y \
    make cmake git \
    gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip \
    make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev git

  echo "Installing tools..."
  sudo apt-get install -y \
    curl \
    flatpak \
    git \
    htop \
    httpie \
    jq \
    jqp \
    kitty \
    neofetch \
    peek \
    php \
    ripgrep \
    screenkey \
    tmux \
    vim \
    wget \
    zsh \
    zoxide

else

  echo "Not on Debian like system"
  echo "Skipping installing system tools..."

fi

echo "Installing flatpak applications..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y \
  flathub com.brave.Browser \
  flathub com.discordapp.Discord \
  flathub com.spotify.Client \
  flathub com.uploadedlobster.peek \
  flathub com.usebruno.Bruno \
  flathub com.valvesoftware.Steam \
  flathub org.flameshot.Flameshot \
  flathub org.keepassxc.KeePassXC \
  flathub org.telegram.desktop

echo "Installing neovim (from source)..."
if ! [ -d $HOME/build/neovim ]; then
  git clone https://github.com/neovim/neovim ~/build/neovim
  cd ~/build/neovim/
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
fi

# PHP tools
if ! [ -x "$(command -v composer)" ]; then
  curl -sS https://getcomposer.org/installer | php
  chmod +x composer.phar
  sudo mv composer.phar /usr/local/bin/composer
fi

# Python tools
if ! [ -d $HOME/.pyenv ]; then
  curl https://pyenv.run | bash
fi

echo "Installing handful terminal apps..."
pip install --break-system-packages --user -U \
  mycli \
  pgcli \
  qmk \
  solaar \
  yt-dlp
