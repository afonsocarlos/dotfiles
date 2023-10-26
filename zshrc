# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Start TMUX by default
# if [ "$TMUX" = "" ]; then tmux; fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export DEFAULT_USER="$USER"

# MySql Prompt improvement Exporting
export MYSQL_PS1="\u@\h [\d] mysql> "

# Android SDK Path exporting
export PATH=$PATH:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:$HOME/Android/Sdk/build-tools:$HOME/.config/composer/vendor/bin:$HOME/.yarn/bin:/opt/flutter/bin

# set xterm for appearance improvement
export TERM="xterm-256color"

# New zsh theme is pure!!
ZSH_THEME=""

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

source $ZSH/oh-my-zsh.sh

# Sourcing icons
if [[ -d ~/.fonts ]]; then
    source ~/.fonts/*.sh
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# binding keys
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line

alias icat="kitty +kitten icat"
alias rg="rg --smart-case"

# Overcoming muscle memory
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Alert on completion of shell commands
alias tg='telegram-send "$([ $? = 0 ] && echo "" || echo "error: ") $(echo $history[$HISTCMD]|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*tg$//'\'')"'

# Get remaining batttery life percentage
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '\''/percentage/ { print $2 }'\'''

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#################### Theme ####################
zinit pick"async.zsh" src"pure.zsh" light-mode for sindresorhus/pure

#################### Packages ####################
zinit wait lucid light-mode for \
    zsh-users/zsh-completions \
    zdharma-continuum/fast-syntax-highlighting

# Add github like contributions calendar on terminal
zinit as"program" wait lucid for \
    k4rthik/git-cal \
    so-fancy/diff-so-fancy \
    mrowa44/emojify

# Add GIF optimization script
zinit as"program" wait lucid for \
    pick"gif_optmize.sh" https://gist.githubusercontent.com/afonsocarlos/0143bc204a86be9d2a32abfe6900c930/raw/ff7013d09feba61cf58860d54bc4b87238b06e19/gif_optmize.sh \
    pick"whatismyip" https://gist.githubusercontent.com/afonsocarlos/87e0b6a1a3099fd7d1a253b2a48f886b/raw/29f47f4863b005aefe9cd3f13ae668adc9a49e77/whatismyip

# Oh-my-zsh plugins
zinit snippet OMZP::battery
zinit snippet https://raw.githubusercontent.com/afonsocarlos/ohmyzsh/8b0f735cd37fcdedf1c1c2c206fabcf123b6e4a9/plugins/git/git.plugin.zsh

export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_SYMLINK_CURRENT="true"
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('git' 'nvim')
zinit wait lucid light-mode for lukechilds/zsh-nvm
###############################################

PROMPT="%(1j.[%j] .)"$PROMPT

if command -v neofetch >/dev/null 2>&1; then
    alias clear='clear; neofetch'
    clear; neofetch
fi
