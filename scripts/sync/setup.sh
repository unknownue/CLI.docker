#!/usr/bin/env bash

# Usage: bash scripts/sync/setup.sh

cp -r config/nvim/. ~/.config/nvim/

# install plugin for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c "PlugInstall" -c q -c q
