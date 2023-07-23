# Japanese settings
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# Read modules
source "$ZDOTDIR/scripts/AntigenConfig.zsh" > /dev/null

# Complement settings
# Use compinit
autoload -Uz compinit
compinit
# Auto correct commands
setopt correct
# Hit correct large character
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Chose correct commands by arrow key
zstyle ':completion:*:default' menu select=2

# Directory switch settings
# Omit cd command
setopt auto_cd
# Auto pushd
setopt auto_pushd
setopt pushd_ignore_dups

# History settings
# Share history
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt histignorealldups
# Auto print date in history
alias history='fc -lt '%F %T' 1'

# Shell looks settings
PROMPT=$(
  source "$ZDOTDIR/scripts/CreatePrompt.zsh"
  prompt
)

# Set key bind
if [[ -e "$HOME/.Xmodmap/.Xmodmap" ]]; then
  xmodmap ~/.Xmodmap/.Xmodmap
fi

# Functions
# zsh config settings
zcon() {
  (
    source "$ZDOTDIR/scripts/ZshConfig.zsh"

    if [[ $# -eq 0 ]]; then
      zcon-help
    else
      if [[ "$1" = "update" ]]; then
        zcon-update
      else
        print "The command not found : $1"
        zcon-help
      fi
    fi
  )
}
# Run mkdir and cd at the same time
mkcd() {
  if [[ $# -ge 1 ]]; then
    if [[ -d "$1" ]]; then
      cd "$1" || exit
    else
      mkdir -p "$1" && cd "$1" || exit
    fi
  else
    cd "$HOME" || exit
  fi
}

# Aliases
alias exz='exec zsh'
alias \$=''
alias \#='sudo'
alias rma='rm -r'
alias ls='ls --color=auto'