

" ----------------------------------------------------------------------------------
" Vim-plug Start
call plug#begin('~/.local/share/nvim/plugged')

" Development Specific
if system('echo $ENV_DEV') =~ "base"
    " Do nothing
elseif system('echo $ENV_DEV') =~ "cpp"
    source ~/.config/nvim/plugs/cpp/plugin.vim
elseif system('echo $ENV_DEV') =~ "rust"
    source ~/.config/nvim/plugs/rust/plugin.vim
elseif system('echo $ENV_DEV') =~ "python"
    source ~/.config/nvim/plugs/python/plugin.vim
else
    echo "Unknown Dev"
endif


" GUI enhance
Plug 'mhinz/vim-startify'                      " Welcome screen for neovim.
Plug 'preservim/nerdtree'                      " A tree explorer plugin for vim.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Add icon highlight for nerdtree
Plug 'vim-airline/vim-airline'                 " tabline for vim

" Theme
Plug 'joshdick/onedark.vim'             " One Dark theme for vim (Dark theme)
Plug 'dracula/vim', { 'as': 'dracula' } " Dracula theme(Dark theme)
Plug 'jdkanani/vim-material-theme'      " Material theme for vim (Dark theme)
Plug 'altercation/vim-colors-solarized' " Colarized theme for vim (Light and Dark theme)
Plug 'vim-airline/vim-airline-themes'   " theme for vim-ariline

" Editor
Plug 'tpope/vim-repeat'              " Ex version of '.'
Plug 'andrewradev/sideways.vim'      " Switch function parameters
Plug 'AndrewRadev/splitjoin.vim'     " switching statement between single-line and multi-lines
Plug 'easymotion/vim-easymotion'     " Vim motion on speed!
Plug 'haya14busa/incsearch.vim'      " Improved incremental searching for Vim
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'       " Auto comment by programming language 
Plug 'terryma/vim-multiple-cursors'  " Multi-line edit
Plug 'machakann/vim-highlightedyank' " Hint for copied text
Plug 'qpkorr/vim-bufkill'            " Helper to kill buffer
Plug 'easymotion/vim-easymotion'     " Move cursor to anywhere
Plug 'junegunn/vim-easy-align'       " Vim alignment plugin

" Interactive
Plug 'skywind3000/asyncrun.vim'                  " Run shell commands in background
Plug 'jacob-ogre/vim-syncr'                      " Sync local and remote files and directories from Vim
Plug 'junegunn/fzf', { 'do': './install --bin' } " FZF
Plug 'junegunn/fzf.vim'
Plug 'ZSaberLv0/ZFVimDirDiff'                    " Diff two directories like BeyondCompare
Plug 'skywind3000/vim-terminal-help'             " Wrapper for terminal in neovim

" Language
Plug 'ekalinin/Dockerfile.vim'  " Vim syntax file for Dockerfile
Plug 'plasticboy/vim-markdown'  " Syntax highlighting...etc for the Markdown

" Fonts
" Use 'DroidSansMono Nerd Font Mono' for icon support
if !has("gui_vimr")
    Plug 'ryanoasis/vim-devicons'  " Add icons to plugs " Conflict with vim-airline/vim-airline
endif

" Unused plug
" Replace by smart tab line in vim-airline/vim-airline
" Plug 'ap/vim-buftabline'    " buffer bar for vim
" Conflict to colemak.vim
" Plug 'junegunn/vim-slash'   " Remove highlight when cursor is moved
" Plug 'tmhedberg/SimpylFold' " Code folding

call plug#end()
" ----------------------------------------------------------------------------------
