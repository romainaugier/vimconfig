" Don't be vi compatible
set nocompatible

" utf8 encoding always
set encoding=utf-8

set signcolumn=yes

set updatetime=300

" search down into subfolders
set path+=**
set wildmenu

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

" Turn on syntax highlighting
syntax on

" completion
filetype plugin on
filetype plugin indent on

" Show line numbers
set number
set numberwidth=4

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" smart indentation
set smartindent
set autoindent

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

" splits
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Leader key
let mapleader = "," 

" Completion
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

" Save when we write changes
set autowriteall

" Delete/Close buffer, when no buffer left
" it opens a new blank one
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Advanced
set ruler	
set showtabline=2	 

set undolevels=1000	
" set backspace=indent,eol,start

" ALE settings
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 0
let g:ale_virtualtext_cursor = 'current'
let g:ale_sign_column_always = 1

" plugs
call plug#begin()

Plug 'itchyny/lightline.vim'

Plug 'ghifarit53/tokyonight-vim'

Plug 'tpope/vim-commentary' " gcc to comment a line, gc to comment a bloc in visual mode

Plug 'sheerun/vim-polyglot'

Plug 'terryma/vim-multiple-cursors'

Plug 'jiangmiao/auto-pairs'

Plug 'dense-analysis/ale'

Plug 'maximbaz/lightline-ale'

call plug#end()

" color scheme
set termguicolors

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight 

set background=dark

let g:lightline = { 'colorscheme': 'tokyonight' }

" ale configuration for lightline
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \            [ 'lineinfo' ],
    	    \            [ 'percent' ],
	        \            [ 'fileformat', 'fileencoding', 'filetype'] ] }
