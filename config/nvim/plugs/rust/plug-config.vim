
let g:startify_custom_header = [
\ '',
\ '           ____  _                 _',
\ '          |  _ \| |__   __ _ _ __ | |_ __ _ ___ _ __ ___',
\ '          | |_) |  _ \ / _` |  _ \| __/ _` / __|  _ ` _ \',
\ '          |  __/| | | | (_| | | | | || (_| \__ \ | | | | |',
\ '          |_|   |_| |_|\__,_|_| |_|\__\__,_|___/_| |_| |_|',
\ '',
\ ]

" ##################################################################################
" Plugin configuration for rust development

" Config for 'neovim/nvim-lsp' -------------------------------------------- 
" setup rust_analyzer LSP (IDE features)
lua require'nvim_lsp'.rust_analyzer.setup({})
" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
" -------------------------------------------------------------------------

" Config for deoplete -----------------------------------------------------
" Enable deoplete autocompletion in Rust files
let g:deoplete#enable_at_startup = 1

" close preview window on leaving the insert mode
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

" customise deoplete maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>""
" -------------------------------------------------------------------------

" ##################################################################################

