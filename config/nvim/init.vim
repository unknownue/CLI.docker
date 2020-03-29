
" ##############################################################
" Entry point for Neovim.
"  _   _                 _              ___       _ _
" | \ | | ___  _____   _(_)_ __ ___    |_ _|_ __ (_) |_
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \    | || '_ \| | __|
" | |\  |  __/ (_) \ V /| | | | | | |   | || | | | | |_
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|  |___|_| |_|_|\__|
"
" ##############################################################
"

" Reload vimrc after saving
" autocmd! BufWritePost $MYVIMRC source $MYVIMRC

set encoding=UTF-8

" Load base config for vim
source ~/.config/nvim/setting.vim
" Load plugin list
source ~/.config/nvim/plugs/plugin.vim
" Load custom functions
source ~/.config/nvim/function.vim
" Load Plugin config
source ~/.config/nvim/plugs/plug-config.vim
" Load keymapping
source ~/.config/nvim/colemak.vim
