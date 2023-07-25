zcon-help() {
  print "Please specify subcommands \n"
  print "update    update repository"
}

zcon-update() {
  git -C "$ZDOTDIR" reset --soft origin/main
  git -C "$ZDOTDIR" stash save -u "Made by zcon-update"
  git -C "$ZDOTDIR" checkout main
  git -C "$ZDOTDIR" pull
  git -C "$ZDOTDIR" stash pop stash@\{0\}
  git -C "$ZDOTDIR" checkout --ours .
  exz
}