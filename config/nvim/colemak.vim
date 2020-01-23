
" #################################################################################################
" Keymapping for colemak in neovim

"  map 	     noremap 	 unmap 	      mapclear 	    effact mode
" :map 	    :noremap 	:unmap 	    :mapc[lear] 	Normal, Visual, Select, Operator-pending
" :nmap 	:nnoremap 	:nunmap 	:nmapc[lear] 	Normal
" :vmap 	:vnoremap 	:vunmap 	:vmapc[lear] 	Visual and Select
" :smap 	:snoremap 	:sunmap 	:smapc[lear] 	Select
" :xmap 	:xnoremap 	:xunmap 	:xmapc[lear] 	Visual
" :omap 	:onoremap 	:ounmap 	:omapc[lear] 	Operator-pending
" :map! 	:noremap! 	:unmap! 	:mapc[lear]! 	Insert and Command-line
" :imap 	:inoremap 	:iunmap 	:imapc[lear] 	Insert
" :lmap 	:lnoremap 	:lunmap 	:lmapc[lear] 	Insert, Command-line, Lang-Arg
" :cmap 	:cnoremap 	:cunmap 	:cmapc[lear] 	Command-line

" Reload vimrc after saving
" autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" Up/down/left/right
" nnoremap h h|xnoremap h h|onoremap h h| " left
nnoremap n j|xnoremap n j|onoremap n j| " down
nnoremap e k|xnoremap e k|onoremap e k| " up
nnoremap i l|xnoremap i l|onoremap i l| " right

" Words forward/backward
" nnoremap b b|xnoremap b b|onoremap b b| " back word
" nnoremap B B|xnoremap B B|onoremap B B| " back word
nnoremap f e|xnoremap f e|onoremap f e| " next word end
nnoremap F E|xnoremap F E|onoremap F E| " next word end
" nnoremap w w|xnoremap w w|onoremap w w| " next word start
" nnoremap W W|xnoremap W W|onoremap W W| " next word start

" Insert/Replace/Append/Delete/Open line/Goto
nnoremap u i| " insert to current cursor
nnoremap U I| " insert to line beginning
" nnoremap a a| " Append to current cursor
" nnoremap A A| " Append to up line
nnoremap p r| " Replace a character
nnoremap P R| " Set to replace mode at current cursor
nnoremap s d| xnoremap s d| onoremap s d| " delete | operator-pending
nnoremap S D| xnoremap S D| onoremap S D| " change the line at the line beginning
nnoremap y o| " create new line at the next line of cursor
nnoremap Y O| " create new line at the previous line of cursor
nnoremap d g| " goto
nnoremap D G| " jump to eof

" Undo/Redo
nnoremap l u| " undo
nnoremap L U| " undo line
nnoremap z <C-r> " redo

" Copy/Paste
nnoremap j y| xnoremap j y| " copy
nnoremap J Y| xnoremap J Y| " copy line
nnoremap ; p| xnoremap ; p| " paste to next line
nnoremap : P| xnoremap : P| " paste to previous line

" Command line
nnoremap o ;| " jump to next search
nnoremap O :| " command line

" Search char
nnoremap t f| onoremap t f| " Search to line right | operator-pending
nnoremap T F| onoremap T F| " Search to line left  | operator-pending 
nnoremap k n| " find next
nnoremap K N| " find previous

" Unmap key
" r -> s

" Custom keymapping
nnoremap <leader>c :set nohlsearch<CR>
" #################################################################################################


" #################################################################################################
" Plugin keymapping

" Keymapping for sideways """"""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for vim-buftabline
nnoremap <C-k> :bnext<CR>
nnoremap <C-K> :bprev<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for nerdtree """"""""""""""""""""""""""""""""""""""""""""""
" close NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug vim-slash """""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <plug>(slash-after) zz
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for SimpyFold """"""""""""""""""""""""""""""""""""""""""""""
"Usage:
"    zo  -> open folding at cursor
"    zO  -> recusive open folding at cursor
"    zc  -> close folding at cursor
"    zC  -> close all folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #################################################################################################
