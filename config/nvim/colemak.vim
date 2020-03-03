
" #############################################################################################
" Keymapping for colemak in neovim
" 
"   ____      _                      _    
"  / ___|___ | | ___ _ __ ___   __ _| | __
" | |   / _ \| |/ _ \ '_ ` _ \ / _` | |/ /
" | |__| (_) | |  __/ | | | | | (_| |   < 
"  \____\___/|_|\___|_| |_| |_|\__,_|_|\_\
"                                         
" #############################################################################################


" Use ":help keycodes" to see all key notation
" :h key-notation
" <ESC> -> Escape
" <CR>  -> Enter
" <C-?> -> Ctrl
" <S-?> -> Shift
" <D-?> -> Command
" <M-?> or <A-?> -> Alt/Option

" Set <leader> key
let mapleader=" "

" -----------------------------------------------------------------------------------
"  map 	     noremap 	 unmap 	      mapclear 	    effact mode
" -----------------------------------------------------------------------------------
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
" -----------------------------------------------------------------------------------

" Reload the all configuration
nnoremap <leader>0 :source ~/.config/nvim/init.vim<CR> <C-w><right>
" Toggle NERDTree
nnoremap <leader>` :NERDTreeToggle<CR>
" Toggle file sync
nnoremap <leader>7 :call NVimToggleFileSync()<CR>
" Toggle spell check
nnoremap <leader>8 :set spell!<CR>
" Call figlet to print ASCII art
nnoremap <leader>9 :r !figlet 

" Press space twice to jump to the next '<++>' and edit it
" nnoremap <leader><leader> <Esc>/<++><CR>:nohlsearch<CR>c4i


" Adjust view area
" Use <PageUp> and <PageDown> to scroll a page
" Use Shift + <PageUp>/<PageDown> to scroll half page
nnoremap <S-PageUp>   <C-u>
nnoremap <S-PageDown> <C-d>
" Adjust display area
nnoremap <C-[> 3<C-e>
nnoremap <C-]> 3<C-y>


" Up/down/left/right
" nnoremap h h|xnoremap h h|onoremap h h| " left
nnoremap n j|xnoremap n j|onoremap n j| " down
nnoremap e k|xnoremap e k|onoremap e k| " up
nnoremap i l|xnoremap i l|onoremap i l| " right
" Move cursor faster
nnoremap <S-h> 4h|xnoremap <S-h> 4h|onoremap <S-h> 4h
nnoremap <S-e> 4k|xnoremap <S-e> 4k|onoremap <S-e> 4k
nnoremap <S-n> 4j|xnoremap <S-n> 4j|onoremap <S-n> 4j
nnoremap <S-i> 4l|xnoremap <S-i> 4l|onoremap <S-i> 4l

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
" nnoremap y o| " create new line at the next line of cursor
" nnoremap Y O| " create new line at the previous line of cursor
nnoremap d g|  " goto
nnoremap D G|  " jump to eof
nnoremap dd gg " jump to start of file

" Undo/Redo
nnoremap z u
nnoremap <C-z> <C-r> " redo

" Copy/Paste
nnoremap j y| xnoremap j y| " copy
nnoremap J Y| xnoremap J Y| " copy line
nnoremap l p| xnoremap l p| " paste to next line
nnoremap l P| xnoremap l P| " paste to previous line

" Command line
" nnoremap o ;| " jump to next search
" nnoremap O :| " command line

" Search char/Selection
nnoremap t f| onoremap t f| " Search to line right | operator-pending
nnoremap T F| onoremap T F| " Search to line left  | operator-pending 
nnoremap k n| " find next
nnoremap K N| " find previous
nnoremap g t| onoremap g t| onoremap g t| " -> until char
nnoremap G T| onoremap G T| onoremap G T| " <- until char
nnoremap = nzz
nnoremap - Nzz

" Custom keymapping
" unhightlight
nnoremap <leader><CR> :nohlsearch<CR>
" Toggle line number
" nnoremap <C-i> :set invnumber invrelativenumber<CR>

" Select All
nnoremap <C-a> ggVG

" Spilit screen
nnoremap <leader><C-left>  :set nosplitright<CR>:vsplit<CR>
nnoremap <leader><C-right> :set splitright<CR>:vsplit<CR>
nnoremap <leader><C-up>    :set nosplitbelow<CR>:split<CR>
nnoremap <leader><C-down>  :set splitbelow<CR>:split<CR>
" Switch screen
nnoremap <leader><left>  <C-w><left>
nnoremap <leader><right> <C-w><right>
nnoremap <leader><up>    <C-w><up>
nnoremap <leader><down>  <C-w><down>
nnoremap <leader>-       <C-w>t<C-w>H  " Switch to vertical screen spliting
nnoremap <leader>+       <C-w>t<C-w>K  " Switch to horizontal screen spliting
" Adjust screen size
nnoremap <C-up>    :res +5<CR>
nnoremap <C-down>  :res -5<CR>
nnoremap <C-left>  :vertical resize-5<CR>
nnoremap <C-right> :vertical resize+5<CR>


" Support Copy text from vim to system clipboard
" For linux
" See also https://neovim.io/doc/user/provider.html#clipboard
vnoremap <C-c> :w !xclip -i -sel c<CR><CR>
nnoremap <C-c> "+yg_
nnoremap <C-v> "+p
nnoremap <C-V> "+P

" For macOS
" vmap <C-c> :w !pbcopy<CR><CR>
" #################################################################################################



" #################################################################################################
" Plugin keymapping

" Keymapping for sideways """"""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-k> :SidewaysLeft<CR>
nnoremap <C-m> :SidewaysRight<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for buffers """""""""""""""""""""""""""""""""""""""""""""""
" See also https://superuser.com/questions/289285/how-to-close-buffer-without-closing-the-window

" Switch buffer
nnoremap <C-\> :bnext<CR>
" Delete current Buffer
nnoremap <leader><BS> :BD<CR>
" Move to backward buffer
" nnoremap <C-[> :BB<CR>
" Move to forward buffer
" nnoremap <C-]> :BF<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for nerdtree """"""""""""""""""""""""""""""""""""""""""""""

" open in prew window: j -> y
let NERDTreeMapActivateNode='y'
" preview: go -> dy
let NERDTreeMapPreview='dy'
" open in new tab: t -> g
let NERDTreeMapOpenInTab='g'
" open in new tab silently: T -> G
let NERDTreeMapOpenInTabSilent='G'
" open spiit: i -> 'u'
let NERDTreeMapOpenSplit='u'
" preview split: gi -> 'du'
let NERDTreeMapPreviewSplit='du'
" open vsplit: s -> 'r'
let NERDTreeMapOpenVSplit='r'
" preview vsplit: gs -> 'dr'
let NERDTreeMapPreviewVSplit='dr'
" Recursively open directory node: O -> 'Y'
let NERDTreeMapOpenRecursively='Y'
" Explore selected dir: f -> 'T'
let NERDTreeMapToggleFilters='T'
" Explore selected dir: t -> 'f'
let NERDTreeMapOpenExpl='f'

" Delete bookmark: D -> 'S'
let NERDTreeMapDeleteBookmark='S'

" Go to root: P -> 'J'
let NERDTreeMapJumpRoot='J'
" Go to parent: p -> 'j'
let NERDTreeMapJumpParent='j'

" Move tree root up a dir: u -> 'l'
let NERDTreeMapUpdir='l'
" Move tree root up a dir but leave old root open: U -> 'L'
let NERDTreeMapUpdirKeepOpen='L'
" Refresh cursor dir: r -> 'p'
let NERDTreeMapRefresh='p'
" Refresh current root: R -> 'P'
let NERDTreeMapRefreshRoot='P'

" Hidden files: I -> 'U'
let NERDTreeMapToggleHidden='U'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for nerdcommenter """""""""""""""""""""""""""""""""""""""""
" Toggles the comment state of the selected line(s)
xnoremap <leader>/ :call NERDComment(0, "toggle")<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug vim-slash """""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <plug>(slash-after) zz
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for SimpyFold """""""""""""""""""""""""""""""""""""""""""""
"Usage:
"    zo  -> open folding at cursor
"    zO  -> recusive open folding at cursor
"    zc  -> close folding at cursor
"    zC  -> close all folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Keymapping for jacob-ogre/vim-syncr """"""""""""""""""""""""""""""""""

" Disable default key bindings
nnoremap <leader>sf <Nop>
nnoremap <leader>sd <Nop>
nnoremap <leader>sdf <Nop>

" Toggle sync after buffer writing
function! NVimFileSync()
    if get(g:, "nvim_file_sync", 1) |
        :Suplfil
    endif
endfunction

function! NVimToggleFileSync()
    if get(g:, "nvim_file_sync", 1) |
        let g:nvim_file_sync = 0
        echo 'File sync disable...'
    else
        let g:nvim_file_sync = 1
        echo 'File sync enable...'
    endif
endfunction

augroup VimFileSync
  autocmd!
  autocmd BufWritePost * :call NVimFileSync()
augroup END

" Customize new keymapping
" sync current file local -> remote
nnoremap <leader>r :Suplfil<CR>
" sync current dir local  -> remote
nnoremap <leader>s :Supldir<CR>
" sync current file remote -> local
" nnoremap <leader>d :Sdownlf<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #################################################################################################
