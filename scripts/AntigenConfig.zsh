# Read antigen
source "$ZDOTDIR/modules/antigen/antigen.zsh"

# Read packages
antigen bundle zsh-users/zsh-autosuggestions 1>/dev/null 2>&1

antigen apply
