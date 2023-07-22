# Read color config
readColor() (
  DEFCOLORS=(7 93)
  COLORPATH="$ZDOTDIR/config/color"
  if [[ -e "$COLORPATH" ]];then
    source "$COLORPATH"
  fi

  if [[ "${COLORS[$1]}" =~ ^[0-9]+$ ]];then
    print "${COLORS[$1]}"
  else
    print "${DEFCOLORS[$1]}"
  fi
)

# output text with foreground color
# $1: input text
# $2: color
setFore() {
  print "%F{$2}$1%f"
}

# output text with background color
# $1: input text
# $2: color
setBack() {
  print "%K{$2}$1%k"
}

# output user info with color
user() {
  print "$(setBack "$(setFore "%n@%m " "$(readColor 1)")" "$(readColor 2)")$(setBack "$(setFore "" "$(readColor 2)")" "$(readColor 1)")"
}

# output current directory info with color
dir() {
  print "$(setBack "$(setFore  "%~ " "$(readColor 2)")" "$(readColor 1)")$(setFore "" "$(readColor 1)")"
}

# output PROMPT
prompt() {
  print "$(user)$(dir) "
}