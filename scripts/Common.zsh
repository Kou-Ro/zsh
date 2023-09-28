# Japanese settings
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# Read modules
source "$ZDOTDIR/scripts/AntigenConfig.zsh" > /dev/null

# Complement settings
# Use compinit
autoload -Uz compinit
# Add completion dir to fpath
FPATH="$FPATH:$ZDOTDIR/completion"
compinit
# Auto correct commands
setopt correct
# Hit correct large character
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Chose correct commands by arrow key
zstyle ':completion:*:default' menu select=2

# Directory switch settings
# Omit cd command
setopt auto_cd
# Auto pushd
setopt auto_pushd
setopt pushd_ignore_dups

# History settings
# Share history
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt histignorealldups
# Auto print date in history
alias history='fc -lt '%F %T' 1'

# Shell looks settings
PROMPT=$(
  source "$ZDOTDIR/scripts/CreatePrompt.zsh"
  prompt
)

# Set key bind
if [[ -e "$HOME/Xmodmap/.xmodmaprc" ]]; then
  xmodmap ~/Xmodmap/.xmodmaprc
fi

# Git completion settings
zstyle ':completion:*:*:git:*' script "$ZDOTDIR"/completions/git-completion.bash
autoload -Uz compinit && compinit

# Read definitions
source "$ZDOTDIR/scripts/Definition.zsh"
