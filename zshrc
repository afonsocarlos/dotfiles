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

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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

# binding keys
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias icat="kitty +kitten icat"

# Overcoming muscle memory
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Alert on completion of shell commands
alias tg='telegram-send "$([ $? = 0 ] && echo "" || echo "error: ") $(echo $history[$HISTCMD]|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*tg$//'\'')"'

# Install zplug automatically, if not installed yet
if [[ ! -d ~/.zplug ]]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

#################### Packages ####################
# Add zsh-syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Add zsh-completions
zplug "zsh-users/zsh-completions"

# Add github like contributions calendar on terminal
zplug "k4rthik/git-cal", as:command

# Emoji on the command line
zplug "mrowa44/emojify", as:command, use:emojify

# Add GIF optimization script
zplug "Charliiee/0143bc204a86be9d2a32abfe6900c930", from:gist, as:command, use:gif_optmize.sh
zplug "Charliiee/87e0b6a1a3099fd7d1a253b2a48f886b", from:gist, as:command, use:whatismyip

# Oh-my-zsh plugins
zplug "plugins/battery", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

#################### Theme ####################
# Add pure theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

###############################################

# Update zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load all plugins
zplug load

PROMPT="%(1j.[%j] .)"$PROMPT

if command -v neofetch >/dev/null 2>&1; then
    alias clear='clear; neofetch --ascii "$(fortune -e ~/.config/fortunes | cowsay -f ~/.config/cowsay/cows/yin-yang.cow -W 30)"'
    clear; neofetch --ascii "$(fortune -e ~/.config/fortunes | cowsay -f ~/.config/cowsay/cows/yin-yang.cow -W 30)"
fi
