#!/usr/bin/env bash

# Usage: bash scripts/sync/setup.sh

cp -r config/nvim/. ~/.config/nvim/

# Install neovim and install plugin
pacman -S --noconfirm --noprogressbar --need neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c "PlugInstall" -c q -c q
