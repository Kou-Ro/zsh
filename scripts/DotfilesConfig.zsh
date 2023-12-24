dcon-help() {
  print "Please specify subcommands \n"
  print "update    update repository"
  print "help      output this help"
}

dcon-update() {
  # submodules update
  git -C "${DOTFILES}/zsh" reset --hard origin/HEAD
  git -C "${DOTFILES}/zsh" pull
  git -C "${DOTFILES}/zsh" submodule update --recursive --init --force

  # zsh files update
  compdir="${DOTFILES}/zsh/completion"

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

  # zsh reload
  exec zsh
}