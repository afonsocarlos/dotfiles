# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Start TMUX by default
# if [ "$TMUX" = "" ]; then tmux; fi

# Path to your oh-my-zsh installation.
export DEFAULT_USER="$USER"

# MySql Prompt improvement Exporting
export MYSQL_PS1="\u@\h [\d] mysql> "

# Android SDK Path exporting
export PATH=$PATH:$HOME/.local/bin:$HOME/dev/scripts:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:$HOME/Android/Sdk/build-tools:$HOME/.config/composer/vendor/bin:$HOME/.yarn/bin:/opt/flutter/bin

# set xterm for appearance improvement
export TERM="xterm-256color-italic"

# New zsh theme is pure!!
ZSH_THEME=""

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

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

export MANPAGER='nvim +Man!'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# binding keys
bindkey -e
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line

# Git aliases
alias glr='git log origin/$(git_current_branch)..'
alias gdr='git diff origin/$(git_current_branch)..'

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
# zinit pick"async.zsh" src"pure.zsh" light-mode for sindresorhus/pure

# Load starship theme
# line 1: `starship` binary as command, from github release
# line 2: starship setup at clone(create init.zsh, completion)
# line 3: pull behavior same as clone, source init.zsh
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

#################### Packages ####################
zinit wait lucid light-mode for \
    zsh-users/zsh-completions \
    zdharma-continuum/fast-syntax-highlighting

# Add github like contributions calendar on terminal
zinit as"program" wait lucid for \
    k4rthik/git-cal \
    so-fancy/diff-so-fancy \
    mrowa44/emojify

zinit as"program" wait lucid for \
    atclone"npm install; npm run build; ln -s ./build/index.mjs git-split-diffs" \
    atpull"%atclone" pick"git-split-diffs" \
    banga/git-split-diffs

zinit from"gh-r" as"program" wait lucid light-mode for \
  pick"tldr" tldr-pages/tlrc

# Add GIF optimization script
# external IP lookup script
# better branch listing for git
zinit as"program" wait lucid for \
    pick"gif_optmize.sh" https://gist.githubusercontent.com/afonsocarlos/0143bc204a86be9d2a32abfe6900c930/raw/ff7013d09feba61cf58860d54bc4b87238b06e19/gif_optmize.sh \
    pick"whatismyip" https://gist.githubusercontent.com/afonsocarlos/87e0b6a1a3099fd7d1a253b2a48f886b/raw/29f47f4863b005aefe9cd3f13ae668adc9a49e77/whatismyip \
    pick"better-git-branch.sh" https://gist.githubusercontent.com/schacon/e9e743dee2e92db9a464619b99e94eff/raw/2e3ae498c2177f5974679a6ab33849cbf33b209e/better-git-branch.sh

# Oh-my-zsh libs
zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZL::cli.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::compfix.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::functions.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::grep.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::misc.zsh
zinit snippet OMZL::spectrum.zsh
zinit snippet OMZL::theme-and-appearance.zsh

# Oh-my-zsh plugins
zinit snippet OMZP::battery
zinit snippet OMZP::alias-finder
zinit snippet OMZP::git
zinit snippet OMZP::colored-man-pages


export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_SYMLINK_CURRENT="true"
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('git' 'nvim')
zinit wait lucid light-mode for lukechilds/zsh-nvm
###############################################

# Pure Prompt
# PROMPT="%(1j.[%j] .)"$PROMPT

if command -v neofetch >/dev/null 2>&1; then
    alias clear='clear; neofetch'
    clear; neofetch
fi
