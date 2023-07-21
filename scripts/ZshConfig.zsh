zcon-help() {
  print "Please specify subcommands \n"
  print "update    update repository"
}

zcon-update() {
  git -C "$ZDOTDIR" checkout main
  git pull
}
