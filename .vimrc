" Don't be vi compatible
set nocompatible

" Leader key
let mapleader = "," 

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

Plug 'ghifarit53/tokyonight-vim'

Plug 'tpope/vim-commentary' " gcc to comment a line, gc to comment a bloc in visual mode

Plug 'terryma/vim-multiple-cursors'

Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'vim-python/python-syntax'

Plug 'bfrg/vim-cpp-modern'

Plug 'valloric/python-indent'

Plug 'kkoomen/vim-doge', { 'tag' : 'v3.10.0', 'do': { -> doge#install() } }

call plug#end()

" syntax highlighting
let g:python_highlight_all = 1

" color scheme
set termguicolors

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight 

set background=dark

function! s:lightline_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
  catch
    let s = ''
  endtry
  return printf('%s %d', s, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction
\ }

let g:lightline = {
            \ 'colorscheme': 'tokyonight',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified', 'coc_error', 'coc_warning', 'coc_hint', 'coc_info' ] ],
            \   'right': [ [ 'lineinfo',  ],
            \              [ 'percent' ],
            \              [ 'fileformat', 'fileencoding', 'filetype'] ]
            \ },
            \ 'component_expand': {
            \   'coc_error'        : 'LightlineCocErrors',
            \   'coc_warning'      : 'LightlineCocWarnings',
            \   'coc_info'         : 'LightlineCocInfos',
            \   'coc_hint'         : 'LightlineCocHints'
            \ }
            \ }

let g:lightline.component_type = {
            \   'coc_error'        : 'error',
            \   'coc_warning'      : 'warning',
            \   'coc_info'         : 'tabsel',
            \   'coc_hint'         : 'middle'
            \ }

autocmd User CocDiagnosticChange call lightline#update()

" coc settings
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gsd :vsp<CR><Plug>(coc-definition)

nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gsy :vsp<CR><Plug>(coc-type-definition)

nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gsi :vsp<CR><Plug>(coc-implementation)

nmap <silent> gr <Plug>(coc-references)
nmap <silent> gsr :vsp<CR><Plug>(coc-references)

" doge settings
let g:doge_doc_standard_python = 'google'
