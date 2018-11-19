""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Created by yjqpro@gmail.com 
" Last modified on: 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ts=4 sw=4 tw=78 noet :
"

set mouse-=a

set guioptions-=T
set guioptions-=e
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=m

"" Enable true color 启用终端24位色
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

if has('gui_macvim')
	set macmeta
endif

set winaltkeys=no

"" 防止tmux下vim的背景色显示异常
"" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
	set t_Co=256
endif

if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" moving window
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" disable arrow key
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" disable hlsearch
noremap <silent><leader>/ :nohls<cr>

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>


