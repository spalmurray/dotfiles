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

" vimplug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" vim-plug config
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'jamessan/vim-gnupg'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'

" Initialize plugin system
call plug#end()

" Show quotes in JSON
let g:conceallevel = 0
let g:indentLine_setConceal = 0

" Configure colorscheme
" Important!!
if has('termguicolors')
set termguicolors
endif
set background=dark
colorscheme gruvbox-material
