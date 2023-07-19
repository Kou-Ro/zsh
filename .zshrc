# Japanese setting
export LANG=ja_JP.UTF-8

# Use colors
autoload -Uz colors
colors

# Use compinit
autoload -Uz compinit
compinit

# Share history
setopt share_history
setopt histignorealldups
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Omit cd command
setopt auto_cd

# Auto pushd
setopt auto_pushd
setopt pushd_ignore_dups

# Auto correct commands
setopt correct

# Chose correct commands by arrow key
zstyle ':completion:*:default' menu select=2

# Hit correct large character
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Auto print date in history
alias history='fc -lt '%F %T' 1'

# Run mkdir and cd at the same time
function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists"
    cd $1 || exit
  else
    mkdir -p $1 && cd $1 || exit
  fi
}

# Set key bind
xmodmap ~/.Xmodmap/.Xmodmap

# Set shell looks
source "$(dirname "$0")/functions/CreatePrompt.zsh"
PROMPT="$(prompt)"
unsets

# Set alias
alias exz='exec zsh'
alias ls='ls --color=auto'
alias \$=''
alias \#='sudo'
alias rma='rm -r'
