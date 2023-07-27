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
        print "The command not found : $1" 1>&2
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