# Functions
# zsh config settings
dcon() {(
    update-zsh() {
        if [[ -f "${DOTFILES}/zsh/scripts/DotfilesConfig.zsh" ]];then
            source "${DOTFILES}/zsh/scripts/DotfilesConfig.zsh"
            dcon-update
        fi
    }

    update-nvim() {
        if [[ -f "${DOTFILES}/nvim/DotfilesConfig.zsh" ]];then
            source "${DOTFILES}/nvim/DotfilesConfig.zsh"
            dcon-update
        fi
    }

    update-tex() {
        if [[ -f "${DOTFILES}/tex/DotfilesConfig.zsh" ]];then
            source "${DOTFILES}/tex/DotfilesConfig.zsh"
            dcon-update
        fi
    }

    update-all(){
        update-zsh
        update-nvim
        update-tex
    }

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
                    update-all
                else
                    if [[ "${2}" = "all" ]];then
                        update-all
                    elif [[ "${2}" = "zsh" ]];then
                        update-zsh
                    elif [[ "${2}" = "nvim" ]];then
                        update-nvim
                    elif [[ "${2}" = "tex" ]];then
                        update-tex
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
)}

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
alias ls='\ls -F --color=auto'
alias ll='\ls -lahF --color=auto'
alias la='\ls -aF --color=auto'
alias lsla='ll'
alias lsa='la'
alias mv='mv -i'
alias cp='cp -i'
if which nvim > "/dev/null" ; then
    alias vim='nvim'
fi
