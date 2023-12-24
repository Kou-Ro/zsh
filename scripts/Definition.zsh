# Functions
# zsh config settings
dcon() {
  (

    if [[ -f "${DOTFILES}/DotfilesConfig.zsh" ]];then
      source "${DOTFILES}/DotfilesConfig.zsh"
      if [[ "${#}" -eq 0 ]];then
        dcon-help
      else
        if [[ "${1}" = "help" ]];then
          dcon-help
        elif [[ "${1}" = "update" ]];then
          dcon-update
        else
          print "The command not found : ${1}" 1>&2
          dcon-help
        fi
      fi
    else
      if [[ "${#}" -eq 0 ]];then
        source "${DOTFILES}/zsh/scripts/DotfilesConfig.zsh"
        dcon-help
      else
        if [[ "${1}" = "help" ]];then
          source "${DOTFILES}/zsh/scripts/DotfilesConfig.zsh"
          dcon-help
        elif [[ "${1}" = "update" ]];then
          if [[ "${#}" -eq 1 ]];then
            if [[ -f "${DOTFILES}/nvim/DotfilesConfig.zsh" ]];then
              source "${DOTFILES}/nvim/DotfilesConfig.zsh"
              dcon-update
            fi
            if [[ -f "${DOTFILES}/zsh/scripts/DotfilesConfig.zsh" ]];then
              source "${DOTFILES}/zsh/scripts/DotfilesConfig.zsh"
              dcon-update
            fi
          else
            if [[ "${2}" = "all" ]];then
              if [[ -f "${DOTFILES}/nvim/DotfilesConfig.zsh" ]];then
                source "${DOTFILES}/nvim/DotfilesConfig.zsh"
                dcon-update
              fi
              if [[ -f "${DOTFILES}/zsh/scripts/DotfilesConfig.zsh" ]];then
                source "${DOTFILES}/zsh/scripts/DotfilesConfig.zsh"
                dcon-update
              fi
            elif [[ "${2}" = "zsh" ]];then
              if [[ -f "${DOTFILES}/zsh/scripts/DotfilesConfig.zsh" ]];then
                source "${DOTFILES}/zsh/scripts/DotfilesConfig.zsh"
                dcon-update
              fi
            elif [[ "${2}" = "nvim" ]];then
              if [[ -f "${DOTFILES}/nvim/DotfilesConfig.zsh" ]];then
                source "${DOTFILES}/nvim/DotfilesConfig.zsh"
                dcon-help
              fi
            else
              print "The command not found : ${1} ${2}" 1>&2
            fi
          fi
        else
          print "The command not found : ${1}" 1>&2
          dcon-help
        fi
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
