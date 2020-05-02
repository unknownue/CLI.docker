
let g:startify_custom_header = [
\ '',
\ '           ____       _____              _',
\ '          |  _ \ _   |_   _|__  _ __ ___| |__',
\ '          | |_) | | | || |/ _ \|  __/ __|  _ \',
\ '          |  __/| |_| || | (_) | | | (__| | | |',
\ '          |_|    \__, ||_|\___/|_|  \___|_| |_|',
\ '                 |___/',
\ '',
\ ]

" ##################################################################################
" Plugin configuration for python development

" Config for 'neovim/nvim-lsp' --------------------------------------
lua require'nvim_lsp'.pyls.setup{
  \ settings = {
  \   pyls = {
  \     plugins = {
  \       pycodestyle = {
  \         enabled = true;
  \         ignore = { "W391", "E221", "E201", "E202", "E203" };
  \         maxLineLength = 120;
  \       };
  \       pyflakes = { enabled = true; };
  \       pylint = { enabled = false; };
  \     }
  \ }
  \ }
  \ }

" Use LSP omni-completion in Rust files
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" disable preview window
" set completeopt-=preview

" use omni completion provided by lsp
set omnifunc=lsp#omnifunc
" -------------------------------------------------------------------


" Config for 'Shougo/deoplete.nvim' ---------------------------------
let g:deoplete#enable_at_startup = 1

" close preview window on leaving the insert mode
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" -------------------------------------------------------------------

" Config for Yggdroot/indentLine ------------------------------------
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" Enable by default
" Use ':IndentLinesToggle' command to toggle the indent display
let g:indentLine_enabled = 1
" -------------------------------------------------------------------
" ##################################################################################

