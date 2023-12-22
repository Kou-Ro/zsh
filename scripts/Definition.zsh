# Functions
# zsh config settings
dcon() {
  (
    source "$ZDOTDIR/scripts/DotfilesConfig.zsh"

    if [[ "${#}" -eq 0 ]]; then
      dcon-help
    else
      if [[ "${1}" = "update" ]]; then
        if [[ "${#}" -eq 1 ]]; then
          dcon-update all
        elif [[ "${2}" = "all" ]];then
          dcon-update all
        elif [[ "${2}" = "zsh" ]];then
          dcon-update zsh
        elif [[ "${2}" = "nvim" ]];then
          dcon-update nvim
        elif [[ "${2}" = "help" ]];then
          dcon-update help
        else
          print "The command not found : ${1} ${2}" 1>&2
          dcon-update help
        fi
      elif [[ "${1}" = "help" ]]; then
        dcon-help
      else
        print "The command not found : ${1}" 1>&2
        dcon-help
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
alias exz='\exec zsh'
alias \$=''
alias \#='\sudo'
alias rma='\rm -r'
alias ls='\ls --color=auto'
alias ll='\ls -lah --color=auto'
alias la='\ls -a --color=auto'
alias lsla='ll'
alias lsa='la'
if which nvim > "/dev/null" ; then
  alias vim='nvim'
fi
