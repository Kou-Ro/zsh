dcon-help() {
  print "Please specify subcommands \n"
  print "update    update repository"
  print "help      output this help"
}

zsh-update() {
  git -C "${ZDOTDIR}" reset --soft origin/main
  stashListB="$(git -C "$ZDOTDIR" stash list 2>/dev/null )"
  git -C "${ZDOTDIR}" stash save -u "Made by dcon-update"
  stashListA="$(git -C "$ZDOTDIR" stash list 2>/dev/null )"
  git -C "${ZDOTDIR}" pull
  git -C "${ZDOTDIR}" submodule update

  compdir="${ZDOTDIR}/completion"

  mv "${compdir}/git-completion.bash" "${compdir}/git-completion.bash.old"
  wget -O "${compdir}/git-completion.bash" "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
  check=${?}
  if [[ ${check} -eq 0 ]]; then
    rm -f "${compdir}/git-completion.bash.old"
  else
    rm -f "${compdir}/git-completion.bash"
    mv "${compdir}/git-completion.bash.old" "${compdir}/git-completion.bash"
  fi

  mv "${compdir}/_git" "${compdir}/_git.old"
  wget -O "${compdir}/_git" "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh"
  check=${?}
  if [[ ${check} -eq 0 ]]; then
    rm -f "${compdir}/_git.old"
  else
    rm -f "${compdir}/_git"
    mv "${compdir}/_git.old" "${compdir}/_git"
  fi
  
  if [[ "$stashListA" != "$stashListB" ]];then
    git -C "$ZDOTDIR" stash pop stash@\{0\}
  fi
  exz
}

nvim-update(){
  git -C "${DOTFILES}/nvim" reset --soft origin/main
  stashListB="$(git -C "${DOTFILES}/nvim" stash list 2>/dev/null )"
  git -C "${DOTFILES}/nvim" stash save -u "Made by dcon-update"
  stashListA="$(git -C "${DOTFILES}/nvim" stash list 2>/dev/null )"
  git -C "${DOTFILES}/nvim" pull
  git -C "${DOTFILES}/nvim" submodule update
}

help-update(){
  dcon-help() {
    print "Please specify subcommands \n"
    print "zsh    update zsh config"
    print "nvim   update nvim config"
    print "help   output  this help"
  }
}

dcon-update(){
  if [[ "${1}" = "zsh" ]];then
    zsh-update
  elif [[ "${1}" = "nvim" ]];then
    nvim-update
  elif [[ "${1}" = "all" ]];then
    zsh-update
    nvim-update
  fi
}