# Set adotdir
export ADOTDIR="$DOTFILES/.antigen"

# Read antigen
source "$ZDOTDIR/modules/antigen/antigen.zsh"

# Read packages
antigen bundle zsh-users/zsh-autosuggestions

# Tell antigen that you're done.
antigen apply