# Read color config
readColor() (
  DEFCOLORS=(250 93)
  COLORPATH="$ZDOTDIR/config/color"
  if [[ -e "$COLORPATH" ]];then
    source "$COLORPATH" > /dev/null
  fi

  if [[ "${COLORS[$1]}" =~ ^[0-9]+$ ]];then
    print "${COLORS[$1]}"
  else
    print "${DEFCOLORS[$1]}"
  fi
)

# Print text with foreground color
# $1: input text
# $2: color
setFore() {
  print "%F{$2}$1%f"
}

# Print text with background color
# $1: input text
# $2: color
setBack() {
  print "%K{$2}$1%k"
}

# Print user info with color
user() {
  print "$(setBack "$(setFore "%n@%m " "$(readColor 1)")" "$(readColor 2)")$(setBack "$(setFore "" "$(readColor 2)")" "$(readColor 1)")"
}

# Print current directory info with color
dir() {
  print "$(setBack "$(setFore  " %~ " "$(readColor 2)")" "$(readColor 1)")$(setFore "" "$(readColor 1)")"
}

# Print PROMPT
prompt() {
  print "$(user)$(dir) "
}