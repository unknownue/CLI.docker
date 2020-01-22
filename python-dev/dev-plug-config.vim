" ##################################################################################
" Plugin configuration for python development

" Config for 'Shougo/deoplete.nvim' """""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

" close preview window on leaving the insert mode
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for neoformat """"""""""""""""""""""""""""""""""""""""""""""
" Usage:
"    <leader>d    -> go to definition
"    K            -> check documentation of class or method
"    <leader>n    -> show the usage of a name in current file
"    <leader>r    -> rename a name

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for jedi-vim """""""""""""""""""""""""""""""""""""""""""""""
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Config for neomake """"""""""""""""""""""""""""""""""""""""""""""""
" Usage:
"    :Neomake -> check grammer manually

" Set default linter to pylint(need pip install pylint)
let g:neomake_python_enabled_makers = ['pylint']

" Auto check grammer
call neomake#configure#automake('nrwi', 500)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ##################################################################################
