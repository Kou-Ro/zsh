# Japanese setting
export LANG=ja_JP.UTF-8

# use colors
autoload -Uz colors
colors

# use compinit
autoload -Uz compinit
compinit

# share history
setopt share_history
setopt histignorealldups
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# omit cd command
setopt auto_cd

# auto pushd
setopt auto_pushd
setopt pushd_ignore_dups

# auto correct commands
setopt correct

# choise correct commands by arrow key
zstyle ':completion:*:default' menu select=2

# hit correct large character
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# auto print date in history
alias history='fc -lt '%F %T' 1'

# run mkdir and cd at the same time
function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

# set key bind
xmodmap ~/.Xmodmap/.Xmodmap

# set shell looks
PROMPT="%~ "

# set PATH
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# set alias
alias exz='exec zsh'
