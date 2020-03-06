
" Reload vimrc after saving
" autocmd! BufWritePost $MYVIMRC source $MYVIMRC

set encoding=UTF-8

" ----------------------------------------------------------------------------------
" Vim-plug Start
call plug#begin('~/.local/share/nvim/plugged')

" Development Customize
source ~/.config/nvim/dev-plug.vim

" Apperance
Plug 'mhinz/vim-startify'      " Welcome screen for neovim.
Plug 'joshdick/onedark.vim'    " One Dark theme for vim
Plug 'preservim/nerdtree'      " A tree explorer plugin for vim.
Plug 'vim-airline/vim-airline' " tabline for vim
Plug 'vim-airline/vim-airline-themes' " theme for vim-ariline

" Editor
Plug 'tpope/vim-repeat'              " Ex version of '.'
Plug 'andrewradev/sideways.vim'      " Switch function parameters
Plug 'easymotion/vim-easymotion'     " Vim motion on speed!
Plug 'haya14busa/incsearch.vim'      " Improved incremental searching for Vim
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'       " Auto comment by programming language 
Plug 'terryma/vim-multiple-cursors'  " Multi-line edit
Plug 'machakann/vim-highlightedyank' " Hint for copied text
Plug 'qpkorr/vim-bufkill'            " Helper to kill buffer
Plug 'easymotion/vim-easymotion'     " Move cursor to anywhere

" Interactive
Plug 'skywind3000/asyncrun.vim'  " Run shell commands in background
Plug 'jacob-ogre/vim-syncr'      " Sync local and remote files and directories from Vim
Plug 'junegunn/fzf', { 'do': './install --bin' } " FZF
Plug 'junegunn/fzf.vim'

" Language
Plug 'ekalinin/Dockerfile.vim'  " Vim syntax file for Dockerfile
Plug 'plasticboy/vim-markdown'  " Syntax highlighting...etc for the Markdown

" Fonts
" Use 'DroidSansMono Nerd Font Mono' for icon support
Plug 'ryanoasis/vim-devicons'  " Add icons to plugs " Conflict with vim-airline/vim-airline

" Unused plug
" Plug 'ap/vim-buftabline' " buffer bar for vim " Replace by smart tab line in vim-airline/vim-airline
" Plug 'junegunn/vim-slash' " Remove highlight when cursor is moved " Conflict to colemak.vim
" Plug 'tmhedberg/SimpylFold' " Code folding

call plug#end()
" ----------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------
" Default configuration for neovim

syntax on
colorscheme onedark

" Set filetype
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" spell check
set nospell " Disable spell by default

" Set indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set foldmethod=indent

" Set backspace can return to last line
" set backspace=indent,eol,start

" Set cursor
set scrolloff=5
" Highlight current line(cursor)
set cul
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Return to last edit position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set default split location to bottom
set splitbelow

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
" set hlsearch      " Turn on highlight when search
" exec "nohlsearch" " Turn off highlight in new file
set ignorecase    " ignore case when searching
set smartcase     " turn on smartcase
" ----------------------------------------------------------------------------------




" ----------------------------------------------------------------------------------
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
" ----------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------
" Load Development Plug config
source ~/.config/nvim/plug-config.vim
source ~/.config/nvim/dev-plug-config.vim

" Load keymapping
source ~/.config/nvim/colemak.vim
" ----------------------------------------------------------------------------------
