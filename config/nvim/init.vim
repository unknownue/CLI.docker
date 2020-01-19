
set encoding=UTF-8

" ##################################################################################
" Vim-plug Start
" ----------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')

" Development Customize


" Apperance
Plug 'joshdick/onedark.vim'    " One Dark theme for vim
Plug 'preservim/nerdtree'      " A tree explorer plugin for vim.
Plug 'ryanoasis/vim-devicons'  " Add icons to plugs
Plug 'vim-airline/vim-airline' " tabline for vim
Plug 'vim-airline/vim-airline-themes' " theme for vim-ariline

" Editor
Plug 'tpope/vim-repeat'              " Ex version of '.'
Plug 'junegunn/vim-slash'            " Remove highlight when cursor is moved
Plug 'easymotion/vim-easymotion'     " Vim motion on speed!
Plug 'haya14busa/incsearch.vim'      " Improved incremental searching for Vim
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'      " Auto comment by programming language
Plug 'terryma/vim-multiple-cursors'  " Multi-line edit
Plug 'machakann/vim-highlightedyank' " Hint for copied text
"Plug 'tmhedberg/SimpylFold'          " Code folding

" Plug vim-airline config
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

" Plug vim-slash
noremap <plug>(slash-after) zz

call plug#end()
" ----------------------------------------------------------------------------------
" Vim-plug End
" ##################################################################################


syntax on
colorscheme onedark
