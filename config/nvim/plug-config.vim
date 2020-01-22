" ##################################################################################

" Plugin configuration for common development

" Config for vim-airline """""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Config for nerdtree """"""""""""""""""""""""""""""""""""""""""""""
" show line number
"let NERDTreeShowLineNumbers=1

"let NERDTreeAutoCenter=1

" Is show hidden files
let NERDTreeShowHidden=1

" Set NERDTree display width
"let NERDTreeWinSize=31

" Share NERDTree when vim is launched
"let g:nerdtree_tabs_open_on_console_startup=1

" Ignore specific files
"let NERDTreeIgnore=['\.pyc','\~$','\.swp']

" show bookmakrs
"let NERDTreeShowBookmarks=1

" Close all NERDTree after the last document was closed.
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for vim-multiple-cursors """"""""""""""""""""""""""""""""""
"Usage: https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/#heading-9
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for vim-multiple-cursors """"""""""""""""""""""""""""""""""
"Usage: https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/#heading-9
" For some theme, the following setting may help
" hi HighlightedyankRegion cterm=reverse gui=reverse

" set the highlight durationg(ms)
"let g:highlightedyank_highlight_duration = 1000
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ##################################################################################
