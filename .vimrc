" Don't be vi compatible
set nocompatible

" search down into subfolders
set path+=**

set wildmenu

" Turn on syntax highlighting
syntax on

" completion
filetype plugin on

" Show line numbers
set number
set numberwidth=4

" tabs
set tabstop=4
set softtabstop=4
set expandtab

" smart indentation
set smartindent

" navigate buffer without losign unsaved work
set hidden

" case insensitive search unless capital letters are used
set ignorecase
set smartcase

" No swap file 
set noswapfile

" hide show
set noshowmode
set laststatus=2

call plug#begin()

Plug 'itchyny/lightline.vim'

Plug 'catppuccin/vim'

call plug#end()

set t_Co=256
let g:lightline = { 'colorscheme' : 'catppuccin_frappe' }

colorscheme catppuccin_frappe

set background=dark
