#!/bin/zsh

target="$(cd "$(pwd)/$(dirname "${0}")" && pwd)"

# Skip worktree
git -C "${target}" update-index --skip-worktree .zshrc
git -C "${target}" update-index --skip-worktree .zprofile
git -C "${target}" update-index --skip-worktree .zlogin
git -C "${target}" update-index --skip-worktree .zlogout

# chenge env
sed -e "s/DOTFILES=\"\${HOME}\/.dotfiles\"/DOTFILES=\"$(echo "${target}" | sed  -e "s/\//\\\\\\//g")\"/" "${target}/.zshenv.def" > "${target}/.zshenv"

# Create .zshenv symbolic link in Home
ln -s --backup=simple -S .bak ~/.dotfiles/zsh/.zshenv ~/