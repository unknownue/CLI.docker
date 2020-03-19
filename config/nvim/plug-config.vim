
" ##########################################################################
" Plugin configuration for common development
"
"  _   _                 _               ____             __ _
" | \ | | ___  _____   _(_)_ __ ___     / ___|___  _ __  / _(_) __ _
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \   | |   / _ \| '_ \| |_| |/ _` |
" | |\  |  __/ (_) \ V /| | | | | | |  | |__| (_) | | | |  _| | (_| |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|   \____\___/|_| |_|_| |_|\__, |
"                                                               |___/
" 
" #########################################################################


" Color Theme for vim """"""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme onedark
let g:nue_theme_index = 1

function! NUE_ToggleTheme()
    if g:nue_theme_index == 0
        let g:nue_theme_index = 1
        echo 'Switch theme to One Dark theme...'
        set background=dark
        colorscheme onedark
    elseif g:nue_theme_index == 1
        let g:nue_theme_index = 2
        echo 'Switch theme to Material theme...'
        set background=dark
        colorscheme material-theme
    elseif g:nue_theme_index == 2
        let g:nue_theme_index = 0
        echo 'Switch theme to Colaized theme...'
        set background=light
        colorscheme solarized
    endif
endfunction
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Config for vim-airline """""""""""""""""""""""""""""""""""""""""""
" Color theme
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
" Enable smarter tab line
" https://:egithub.com/vim-airline/vim-airline#smarter-tab-line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#whitespace#enabled = 1 " Enable trailing whitespace detection

" https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt
function! AirlineInit()
  " let g:airline_section_a = airline#section#create(['mode'])
  if has("gui_vimr")
    let g:airline_section_b = airline#section#create_left(['Sync %{NVimFileSyncStatus()}', 'filetype'])
  else
    let g:airline_section_b = airline#section#create_left(['Sync %{NVimFileSyncStatus()}', '%{WebDevIconsGetFileTypeSymbol()} %{&filetype}'])
  endif
  let g:airline_section_c = airline#section#create(['%f', 'readonly'])
  let g:airline_section_x = airline#section#create([])
  " let g:airline_section_y = airline#section#create_right(['%{getcwd()}'])
  let g:airline_section_z = airline#section#create(['Ln %l/%L.Col %c'])
endfunction
autocmd VimEnter * call AirlineInit()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Config for nerdtree """""""""""""""""""""""""""""""""""""""""""""""
" show line number
"let NERDTreeShowLineNumbers=1

"let NERDTreeAutoCenter=1

" Is show hidden files

" Set NERDTree display width
"let NERDTreeWinSize=31

" Share NERDTree when vim is launched
"let g:nerdtree_tabs_open_on_console_startup=1

" Ignore specific files
let NERDTreeIgnore=['\.pyc', '.git', '.DS_Store']

" show bookmakrs
"let NERDTreeShowBookmarks=1

" Toggle NERDTree on start
" autocmd vimenter * NERDTree
" wincmd w
" autocmd vimEnter * wincmd w

" Close all NERDTree after the last document was closed.
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Config for vim-multiple-cursors """"""""""""""""""""""""""""""""""
"Usage: https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/#heading-9
" For some theme, the following setting may help
" hi HighlightedyankRegion cterm=reverse gui=reverse

" set the highlight durationg(ms)
"let g:highlightedyank_highlight_duration = 1000
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Config for NERDCommenter """"""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Default to show hidden files
let g:NERDTreeShowHidden = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for skywind3000/asyncrun.vim """""""""""""""""""""""""""""""
let g:asyncrun_status = ''
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for plasticboy/vim-markdown """""""""""""""""""""""""""""""
" Disable folding functions of this plugin
let g:vim_markdown_folding_disabled = 1
" Disable Default Key Mappings
let g:vim_markdown_no_default_key_mappings = 1
" Support fo latex math
let g:vim_markdown_math = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for ryanoasis/vim-devicons """""""""""""""""""""""""""""""""
" Disable statusline support
let g:webdevicons_enable_airline_statusline = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for junegunn/fzf """""""""""""""""""""""""""""""""""""""""""
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for skywind3000/vim-terminal-help """"""""""""""""""""""""""
" Set to 0 to hide terminal bufffer in buffer list
let g:terminal_list = 0
" Default shell
let g:terminal_shell = 'fish'
" Terminal height
let g:terminal_height = 10
" Working dir: 0 for unchanged, 1 for file path, 2 for project root
let g:terminal_cwd = 2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ##################################################################################
