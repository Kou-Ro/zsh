#!/bin/zsh

export DOTFILES="${1}/Dotfiles"
export ZDOTDIR="${DOTFILES}/zsh"
source "${ZDOTDIR}/.zshrc"
