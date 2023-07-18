# Read color config
COLORS=(7 93)
COLORPATH="$(dirname "$0")/../config/color"

readColor() {
  while read -r LINE || [ -n "${LINE}" ]
  do
    if [[ "$(print "$LINE" | awk '{ print $1 }')" != "#" ]]; then
      if [[ "$(print "$LINE" | awk '{ print $1 }')" =~ ^COLOR[0-9]\{1,3\}$ && "$(print "$LINE" | awk '{ print $1 }')" != "COLOR0" ]]; then
        if [[ "$(print "$LINE" | awk '{ print $2 }')" =~ ^[0-9]+$ && "$(print "$LINE" | awk '{ print $2 }')" -le 255 ]]; then
          COLORS[$(print "$LINE" | awk '{ print $1 }' | sed -E "s/(COLOR)([0-9]+$)/\2/")]=$(print "$LINE" | awk '{ print $2 }')
        fi
      fi
    fi
  done <"$COLORPATH"
}

# $1: input text
# $2: foreground color
# $3: background color
setColor() {
  echo "%F{$2}%K{$3}$1%k%f"
}

user() {
  readColor
  echo "$(setColor %m@%n "${COLORS[1]}" "${COLORS[2]}")$(setColor  "${COLORS[2]}" "${COLORS[1]}") "
}

resetFunc() {
  unset -f setColor
  unset -f user
  unset -f prompt
}

prompt() {
  echo "$(user)"
}