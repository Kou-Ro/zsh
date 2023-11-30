#!/bin/zsh

# Create .zshenv symbolic link in Home
ln -s --backup=simple -S .bak ~/.dotfiles/zsh/.zshenv ~/

# Skip worktree
git update-index --skip-worktree .zshenv
git update-index --skip-worktree .zshrc
git update-index --skip-worktree .zprofile
git update-index --skip-worktree .zlogin
git update-index --skip-worktree .zlogout