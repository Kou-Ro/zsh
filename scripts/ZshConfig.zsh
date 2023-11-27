zcon-help() {
  print "Please specify subcommands \n"
  print "update    update repository"
}

zcon-update() {
  git -C "$ZDOTDIR" reset --soft origin/main
  stashListB="$(git -C "$ZDOTDIR" stash list 2>/dev/null )"
  git -C "$ZDOTDIR" stash save -u "Made by zcon-update"
  stashListA="$(git -C "$ZDOTDIR" stash list 2>/dev/null )"
  git -C "$ZDOTDIR" checkout main
  git -C "$ZDOTDIR" pull
  compdir="${ZDOTDIR}/completion"
  mv "${compdir}/git-completion.bash" "${compdir}/git-completion.bash.old"
  wget -o "${compdir}/git-completion.bash" "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
  if [[ ${?} -ne 0 ]]; then
    rm -f "${compdir}/git-completion.bash.old"
  else
    rm -f "${compdir}/git-completion.bash"
    mv "${compdir}/git-completion.bash.old" "${compdir}/git-completion.bash"
  fi
  mv "${compdir}/_git" "${compdir}/_git.old"
  wget -o "${compdir}/_git" "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh"
  if [[ ${?} -ne 0 ]]; then
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