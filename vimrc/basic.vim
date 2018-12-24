""""""""""""""""""""""""""""""""""""""""
" 基本的vim配置:没有平台相关设置
" 没有mapping
""""""""""""""""""""""""""""""""""""""""
set nocompatible

syntax on

filetype on

filetype indent on 

set lazyredraw 

set clipboard=unnamed

" 设置 Backspace 键模式
set backspace=eol,start,indent

set nowrap

set ttimeout

set ttimeoutlen=50

set ruler

set history=1000 

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
set fileformats=unix,dos,mac

" 显示行号
set number
set relativenumber

" 搜索基本配置
set hlsearch
set incsearch
set ignorecase
set smartcase

set noswapfile " 禁用交换文件
set noundofile " 禁用undo文件
set nobackup " 禁用备份文件

set novisualbell
set t_vb=

set autoindent smartindent shiftround
set smarttab expandtab
set shiftwidth=2 softtabstop=2 tabstop=2

" 显示正在输入的命令
set showcmd

" 跳转匹配的括号
set showmatch matchtime=2

set wildmenu wildmode=list,full

set laststatus=2

let $LANG = 'en_US'
set langmenu=en_US
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set background=dark
colorscheme desert
