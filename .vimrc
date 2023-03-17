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
Plug 'ghifarit53/tokyonight-vim'
Plug 'tpope/vim-commentary' " gcc to comment a line, gc to comment a bloc in visual mode
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'keremc/asyncomplete-clang.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'sheerun/vim-polyglot'
Plug 'valloric/python-indent'
Plug 'kkoomen/vim-doge', { 'tag' : 'v3.10.0', 'do': { -> doge#install() } }

call plug#end()

" color scheme
set termguicolors

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight 

set background=dark

" add theme to lightline status bar
let g:lightline = { 'colorscheme': 'tokyonight' }

" vim-lsp settings

" Python
if executable('pylsp')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pylsp',
                \ 'cmd': {server_info->['pylsp']},
                \ 'allowlist': ['python'],
                \ })
endif

" Lua
if executable('lua-language-server')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'lua-language-server',
                \ 'cmd': {server_info->['lua-language-server']},
                \ 'allowlist': ['lua'],
                \ })
endif

" C/C++
if executable('clang')
    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#clang#get_source_options())
endif

" Filename
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" key mappings
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes

    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nmap <buffer> gd <Plug>(lsp-definition)
    nmap <buffer> gsd :vsp<CR><Plug>(lsp-definition)

    nmap <buffer> gs <Plug>(lsp-document-symbol-search)
    nmap <buffer> gS <Plug>(lsp-workspace-symbol-search)

    nmap <buffer> gr <Plug>(lsp-references)

    nmap <buffer> gy <Plug>(lsp-type-definition)
    nmap <buffer> gsy :vsp<CR><Plug>(lsp-type-definition)

    nmap <buffer> gi <Plug>(lsp-implementation)
    nmap <buffer> gsi :vsp<CR><Plug>(lsp-implementation)

    nmap <buffer> gr <Plug>(lsp-references)
    nmap <buffer> gsr :vsp<CR><Plug>(lsp-references)

    nmap <buffer> <leader>rn <Plug>(lsp-rename)

    let g:lsp_format_sync_timeout = 1000
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1

" doge settings
let g:doge_doc_standard_python = 'google'
