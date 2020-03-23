
" ###################################################################################
" Colemak keymapping for neovim
" 
"  _   _                 _               ____      _                      _
" | \ | | ___  _____   _(_)_ __ ___     / ___|___ | | ___ _ __ ___   __ _| | __
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \   | |   / _ \| |/ _ \ '_ ` _ \ / _` | |/ /
" | |\  |  __/ (_) \ V /| | | | | | |  | |__| (_) | |  __/ | | | | | (_| |   <
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|   \____\___/|_|\___|_| |_| |_|\__,_|_|\_\
"                                         
" ####################################################################################


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

" Shortcut for execute comman
nnoremap ! :w<CR> :!
" Toggle terminal
let g:terminal_key = '<leader>`'
" Reload the all configuration
nnoremap <leader>0 :w<CR> :source %<CR>
" Toggle NERDTree
nnoremap <leader><Tab> :NERDTreeToggle<CR>
" Toggle spell check
nnoremap <leader>4 :set spell!<CR>
" Toggle background transparent
nnoremap <leader>6 :call Toggle_transparent()<CR>
" Toggle file sync
nnoremap <leader>7 :call NVimToggleFileSync()<CR>
" Toggje colorscheme
nnoremap <leader>8 :call NUE_ToggleTheme()<CR>
" Call figlet to print ASCII art
nnoremap <leader>9 :r !figlet 
" write file if you forgot to give it sudo permission
nnoremap <leader>sudo :w !sudo tee % <CR><CR>
" Toggle mouse support
nnoremap <leader>m :call Toggle_Mouse()<CR>




" Press space twice to jump to the next '<++>' and edit it
" nnoremap <leader><leader> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Terminal
" Quit terminal(option + q)
tnoremap œ <C-\><C-n> :q<CR>
" Create terminal in horizontal(option + 1)
nnoremap ¡ :split term://$SHELL<CR>
" Create terminal in vertical(option + 2)
nnoremap ™ :set splitright<CR> :vs term://$SHELL<CR>
" Open terminal in new buffer(option + 3)
" nnoremap £ :ter ++curwin<CR>
" Open terminal in new tab(option + 4)
nnoremap ¢ :tabe term://$SHELL<CR>


" use q to save file
nnoremap q :w<CR>
" Record macro
nnoremap Q q

" Adjust view area
" Use <PageUp> and <PageDown> to scroll a page
" Use Shift + <PageUp>/<PageDown> to scroll half page
nnoremap <S-PageUp>   <C-u>
nnoremap <S-PageDown> <C-d>
" Adjust display area
" (A special key mapping for mac, which is option+[ or option+])
nnoremap “ 3<C-y>
nnoremap ‘ 3<C-e>


" Up/down/left/right
" nnoremap h h|xnoremap h h|onoremap h h| " left
nnoremap n j| xnoremap n j| onoremap n j| " down
nnoremap e k| xnoremap e k| onoremap e k| " up
nnoremap i l| xnoremap i l| onoremap i l| " right
" Move cursor faster
nnoremap <S-e> 4k| xnoremap <S-e> 4k| onoremap <S-e> 4k
nnoremap <S-n> 4j| xnoremap <S-n> 4j| onoremap <S-n> 4j

" Words forward/backward
" nnoremap b b|xnoremap b b|onoremap b b| " back word
" nnoremap B B|xnoremap B B|onoremap B B| " back word
nnoremap f e| xnoremap f e| onoremap f e| " next word end
nnoremap F E| xnoremap F E| onoremap F E| " next word end
" nnoremap w w|xnoremap w w|onoremap w w| " next word start
" nnoremap W W|xnoremap W W|onoremap W W| " next word start

" Insert/Replace/Append/Delete/Open line/Goto
nnoremap u i| xnoremap u i| onoremap u i| " insert to current cursor
nnoremap U I| " insert to line beginning
" nnoremap a a| " Append to current cursor
" nnoremap A A| " Append to up line
nnoremap p r| " Replace a character
nnoremap P R| " Set to replace mode at current cursor
nnoremap s d| xnoremap s d| onoremap s d| " delete | operator-pending
nnoremap S D| xnoremap S D| onoremap S D| " change the line at the line beginning
" nnoremap y o| " create new line at the next line of cursor
" nnoremap Y O| " create new line at the previous line of cursor
nnoremap d g| xnoremap d g| " goto
nnoremap D G| xnoremap D G| " jump to eof
onoremap 0 ^| onoremap ^ 0| " Swap 0 and ^ functionality in operator-pending mode
nnoremap dd gg " jump to start of file

" Undo/Redo
nnoremap z u
nnoremap <S-z> <C-r> " redo

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
nnoremap g t| xnoremap g t| onoremap g t| " -> until char
nnoremap G T| xnoremap G T| onoremap G T| " <- until char
nnoremap = nzz
nnoremap - Nzz

" Custom keymapping
" unhightlight
nnoremap <leader><CR> :nohlsearch<CR>
" Toggle line number
" nnoremap <C-i> :set invnumber invrelativenumber<CR>

" Select All
nnoremap å ggVG      " That is Option + a on macOS.
nnoremap <C-a> GVgg  " That is Ctrl + a

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
nnoremap <C-left>  :vertical resize+5<CR>
nnoremap <C-right> :vertical resize-5<CR>


" Support Copy text from vim to system clipboard
" See also https://neovim.io/doc/user/provider.html#clipboard
if has("gui_vimr")
    " for macOS
    vnoremap <C-c> :w !pbcopy<CR><CR>
    nnoremap <C-v> :!pbpaste<CR>
    vnoremap <C-v> :!pbpaste<CR>
else
    " for linux
    vnoremap <C-c> :!xclip -in -selection clipboard<CR> u
    nnoremap <C-c> "+yg_
    nnoremap <C-v> "+p
    nnoremap <C-V> "+P
endif
" #################################################################################################



" #################################################################################################
" Plugin keymapping

" Keymapping for sideways """"""""""""""""""""""""""""""""""""""""""""""
function! NVimColemakRemapInsert()
    nnoremap u i| xnoremap u i| onoremap u i
endfunction

" 'ª' and 'º' are key value of option+'('/')' on macOS
" call SidewaysLeft would cause confit to 'i' key, so remap it again
nnoremap ª :SidewaysLeft<CR> call NVimColemakRemapInsert()<CR>
nnoremap º :SidewaysRight<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for buffers """""""""""""""""""""""""""""""""""""""""""""""
" See also https://superuser.com/questions/289285/how-to-close-buffer-without-closing-the-window

" Switch buffer
" Special kep mappinng for macOS(that is option+\ key)
nnoremap « :bnext<CR>
vnoremap « :bnext<CR>
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
nnoremap <leader>/ :call NERDComment(0, "toggle")<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for junegunn/fzf O"""""""""""""""""""""""""""""""""""""""""
" Preview file search
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': 
    \ ['--layout=reverse', '--info=inline', '--preview', '~/.local/share/nvim/plugged/fzf.vim/bin/preview.sh {}']
    \ }, <bang>0)

" Recursive search current directory recursive
" :Rg <keyword>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" List files which only contain the term your searched
" Tips from https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Toggle file search
nnoremap <leader>t :Files<CR>
" Toggle buffers selection
nnoremap <leader>b :Buffers<CR>
" Toggle file content search
nnoremap <leader>r :Find<CR>
" View keymapping in normal, visual, and operator-pending mode(<leader>+k)
nmap <leader>e <plug>(fzf-maps-n)
xmap <leader>e <plug>(fzf-maps-x)
omap <leader>e <plug>(fzf-maps-o)
" Extre keymapping to open file
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
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

" Keymapping for easymotion/vim-easymotion """""""""""""""""""""""""""""
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Move to anywhere
nmap <leader><leader> <Plug>(easymotion-s2)
" Move to line(<leader>+l)
nmap <Leader>i <Plug>(easymotion-overwin-line)
" Move to word(<leader>+w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for jacob-ogre/vim-syncr """"""""""""""""""""""""""""""""""
" Disable default key bindings
nnoremap <leader>sf <Nop>
nnoremap <leader>sd <Nop>
nnoremap <leader>sdf <Nop>

" Toggle sync after buffer writing
let g:nvim_file_sync = 0
function! NVimFileSync()
    if get(g:, "nvim_file_sync", 1) |
        :Suplfil
    endif
endfunction

function! NVimFileSyncStatus()
    if get(g:, "nvim_file_sync", 1) |
        return 'On'
    else
        return 'Off'
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

" Customize new keymapping for file syncing
" sync current file local -> remote
" nnoremap <leader>r :Suplfil<CR>
" sync current dir local  -> remote
" nnoremap <leader>s :Supldir<CR>
" sync current file remote -> local
" nnoremap <leader>d :Sdownlf<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Keymapping for junegunn/vim-easy-align """""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap <leader>- :EasyAlign<CR>
xnoremap <leader>= :EasyAlign<CR>=
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nnoremap ga <Plug>(EasyAlign)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #################################################################################################
