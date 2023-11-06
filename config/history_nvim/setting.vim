
" ----------------------------------------------------------------------------------
" Base configuration for neovim

" Enable transparency for popup-menu
set pumblend=15
hi PmenuSel blend=0

" Set filetype
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Share system clipboard
set clipboard+=unnamedplus

" Enable mouse support
set mousehide
set mouse=a
function! Toggle_Mouse()
    if &mouse == 'a'  " check if mouse is enables
        set mouse="" " disable mouse
    else
        set mouse=a " enable mouse everywhere
    endif
endfunc

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
" Save session after exit neovim
if !has("gui_vimr")
    if system('if [ -d ".git" ]; echo true; else; echo false; end;') =~ 'true'
        " Automatically save the current session whenever vim is closed
        autocmd VimLeave * mksession! ./Session.vim 
    end
endif

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

let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
" ----------------------------------------------------------------------------------
