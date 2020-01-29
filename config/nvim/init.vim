
set encoding=UTF-8

" ##################################################################################
" Vim-plug Start
" ----------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')

" Development Customize
source ~/.config/nvim/dev-plug.vim

" Apperance
Plug 'mhinz/vim-startify'      " Welcome screen for neovim.
Plug 'joshdick/onedark.vim'    " One Dark theme for vim
Plug 'preservim/nerdtree'      " A tree explorer plugin for vim.
Plug 'ap/vim-buftabline'       " buffer bar for vim
Plug 'vim-airline/vim-airline' " tabline for vim
Plug 'vim-airline/vim-airline-themes' " theme for vim-ariline

" Editor
Plug 'tpope/vim-repeat'              " Ex version of '.'
Plug 'andrewradev/sideways.vim'      " Switch function parameters
Plug 'easymotion/vim-easymotion'     " Vim motion on speed!
Plug 'haya14busa/incsearch.vim'      " Improved incremental searching for Vim
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'      " Auto comment by programming language
Plug 'terryma/vim-multiple-cursors'  " Multi-line edit
Plug 'machakann/vim-highlightedyank' " Hint for copied text
"Plug 'tmhedberg/SimpylFold'          " Code folding

" Apperance
Plug 'ryanoasis/vim-devicons'  " Add icons to plugs

" Unused plug
" Conflict to colemak.vim
" Plug 'junegunn/vim-slash'            " Remove highlight when cursor is moved
call plug#end()
" ----------------------------------------------------------------------------------
" Vim-plug End
" ##################################################################################


" ##################################################################################
" Default configuration for neovim

syntax on
colorscheme onedark

" Support Copy text from vim to system clipboard(Ctrl + C on Visual mode)
vmap <C-c> :w !pbcopy<CR><CR>

" Show line number as relative number
set relativenumber
set number
augroup relative_numbser
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Search configuration
set ignorecase    " ignore case when searching
set smartcase     " turn on smartcase
" ##################################################################################




" ##################################################################################
" Necessary code for syntax highlight
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
"endif
" ##################################################################################

" Load Development Plug config
source ~/.config/nvim/plug-config.vim
source ~/.config/nvim/dev-plug-config.vim

" Load keymapping
source ~/.config/nvim/colemak.vim
source ~/.config/nvim/dev-plug-colemak.vim
