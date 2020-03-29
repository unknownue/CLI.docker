#!/usr/bin/env bash

# Usage: bash scripts/sync/sync.sh

# git pull
cp -r config/nvim/. ~/.config/nvim/
# cp system/.bash_profile ~/
cp system/.tmux.conf ~/

