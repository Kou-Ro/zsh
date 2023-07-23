zcon-help() {
  print "Please specify subcommands \n"
  print "update    update repository"
}

zcon-update() {
  git -C "$ZDOTDIR" stash save -u "Made by zcon-update"
  git -C "$ZDOTDIR" checkout main
  git -C "$ZDOTDIR" pull
  git -C "$ZDOTDIR" stash apply stash@\{0\}
  git -C "$ZDOTDIR" stash drop stash@\{0\}
}