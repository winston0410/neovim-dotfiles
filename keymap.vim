"iMap as to esc
" imap ;; <Esc>
" imap <Tab> <Esc>
" vmap ;; <Esc>
" Revert back to previous cursor position
inoremap <Esc> <Esc>`^
"Use space as leader
nnoremap <SPACE> <Nop>
let mapleader=" "

"Copy into clipboard buffer
nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>d "+d
vnoremap <leader>d "+d
"snoremap <leader>y "+y
"xnoremap <leader>y "+y
"Paste from clipboard buffer
nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap <leader>P "+P
vnoremap <leader>P "+P
"Remap Y to y$
" nnoremap Y <NOP>
nnoremap Y y$
"Make s and S noop for using vim sandwich
nnoremap S <NOP>
nnoremap s <NOP>
"Remain in normal mode with o and O
nnoremap o o<esc><cmd>lua require('smart-cursor').indent_cursor()<cr>
" nnoremap o o<esc>
" Break a line in normal mode
nnoremap <C-J> i<CR><ESC>
"Paste in visual mode without copying
vnoremap p pgvy
vnoremap P Pgvy
"Ex-mode
cnoremap <expr> <c-n> wildmenumode() ? "\<c-n>" : "\<down>"
cnoremap <expr> <c-p> wildmenumode() ? "\<c-p>" : "\<up>"
" Shortcut for substitute
nnoremap gs :%s/
vnoremap gs :s/
