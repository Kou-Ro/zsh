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
  if [[ "$stashListA" != "$stashListB" ]];then
    git -C "$ZDOTDIR" stash pop stash@\{0\}
  fi
  exz
}