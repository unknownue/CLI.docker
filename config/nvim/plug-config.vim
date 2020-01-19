" ##################################################################################
" Plugin configuration for common development

" Config for sideways """"""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for vem-tabline """""""""""""""""""""""""""""""""""""""""""
" for vim < 7.4
"set hidden

nmap <leader>h <Plug>vem_move_buffer_left-
nmap <leader>l <Plug>vem_move_buffer_right-
nmap <leader>p <Plug>vem_prev_buffer-
nmap <leader>n <Plug>vem_next_buffer-

nnoremap <leader>1 :1tabnext<CR>
nnoremap <leader>2 :2tabnext<CR>
nnoremap <leader>3 :3tabnext<CR>
nnoremap <leader>4 :4tabnext<CR>
nnoremap <leader>5 :5tabnext<CR>
nnoremap <leader>6 :6tabnext<CR>
nnoremap <leader>7 :7tabnext<CR>
nnoremap <leader>8 :8tabnext<CR>
nnoremap <leader>9 :9tabnext<CR>
""""""""""""'"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for nerdtree """"""""""""""""""""""""""""""""""""""""""""""
" close NERDTree
"map <leader>t :NERDTreeToggle<CR>

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

" Config for SimpyFold """"""""""""""""""""""""""""""""""""""""""""""
"Usage:
"    zo  -> open folding at cursor
"    zO  -> recusive open folding at cursor
"    zc  -> close folding at cursor
"    zC  -> close all folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ##################################################################################
