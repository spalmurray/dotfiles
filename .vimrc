" Spencer's settings :)

" Escape to exit terminal mode
tnoremap <esc> <C-\><C-N>

" Line numbers
set number

" Grey Line at 80 chars
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" Auto-indent
set expandtab
set tabstop=4
set shiftwidth=2
set autoindent

" Auto-close parentheses
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Insert mode cursor
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
autocmd InsertEnter,InsertLeave * set cul!

" Show quotes in JSON
let g:conceallevel = 0
let g:indentLine_setConceal = 0

" Configure colorscheme
" Important!!
if has('termguicolors')
set termguicolors
endif
set background=dark
