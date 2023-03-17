" Don't be vi compatible
set nocompatible

" Leader key
let mapleader = "," 

" utf8 encoding always
set encoding=utf-8

set signcolumn=yes

" limit at 80 chars
set colorcolumn=80

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

" always show statusline
set laststatus=2

" backspace always working
set backspace=indent,eol,start

" splits
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Completion
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

" Save when we write changes
set autowriteall

" Delete/Close buffer, when no buffer left
" it opens a new blank one
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

set undolevels=1000	

" plugs
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary' " gcc to comment a line, gc to comment a bloc in visual mode
Plug 'tomasiser/vim-code-dark'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'valloric/python-indent'
Plug 'kkoomen/vim-doge', { 'tag' : 'v3.10.0', 'do': { -> doge#install() } }

call plug#end()

" color scheme
let g:codedark_italics=1

set t_Co=256
set t_ut=
colorscheme codedark

let g:lightline = { 
            \ 'colorscheme': 'codedark',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status'
            \ },
            \ }


" syntax highlighting
let g:python_highlight_all = 1

" coc settings
nmap <leader>f <Plug>(coc-format-selected)

nmap <buffer> gd <Plug>(coc-definition)
nmap <buffer> gsd :vsp<CR><Plug>(coc-definition)

nmap <buffer> gr <Plug>(coc-references)

nmap <buffer> gy <Plug>(coc-type-definition)
nmap <buffer> gsy :vsp<CR><Plug>(coc-type-definition)

nmap <buffer> gi <Plug>(coc-implementation)
nmap <buffer> gsi :vsp<CR><Plug>(coc-implementation)

nmap <buffer> gr <Plug>(coc-references)
nmap <buffer> gsr :vsp<CR><Plug>(coc-references)

nmap <buffer> <leader>rn <Plug>(coc-rename)

" coc status for lightline
augroup lightline#coc
  autocmd!
  autocmd User CocDiagnosticChange call lightline#update()
  autocmd User CocStatusChange call lightline#update()
augroup END

" coc enter to complete
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" coc highlight words
autocmd CursorHold * silent call CocActionAsync('highlight')

" doge settings
let g:doge_doc_standard_python = 'google'
