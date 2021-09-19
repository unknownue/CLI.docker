 
" ###############################################################################
" Custom functions for neovim
"  _   _                 _             _____                 _   _
" | \ | | ___  _____   _(_)_ __ ___   |  ___|   _ _ __   ___| |_(_) ___  _ __
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \  | |_ | | | | '_ \ / __| __| |/ _ \| '_ \
" | |\  |  __/ (_) \ V /| | | | | | | |  _|| |_| | | | | (__| |_| | (_) | | | |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_| |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|
" 
" ###############################################################################


" Save file with admin -----------------------------
function! NUE_SaveAdmin()
    :w !sudo tee %<CR>
endfunction
" --------------------------------------------------

" Rename current file ------------------------------
" Code from https://vi.stackexchange.com/questions/305/how-can-i-rename-the-file-im-editing
function! NUE_RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name

        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
" map <leader>n :call RenameFile()<cr>
" --------------------------------------------------

