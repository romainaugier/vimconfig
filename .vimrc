" Don't be vi compatible
set nocompatible

" Leader key
let mapleader = "," 

" utf8 encoding always
set encoding=utf-8

set signcolumn=yes

" limit at 80 chars
set colorcolumn=80

" relative line number
set relativenumber

set updatetime=300

" always show one line above/below the cursor
set scrolloff=1

" search down into subfolders
set path+=**
set wildmenu

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

" Freed <C-l> in Netrw
nmap <leader><leader><leader><leader><leader><leader>l <Plug>NetrwRefresh

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

" Moving lines
nnoremap <leader>k :m +1<CR>
nnoremap <leader>j :m -2<CR>

" Remapping jj to esc
inoremap jj <Esc>

" Completion
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

" Save when we write changes
set autowriteall

" Delete/Close buffer, when no buffer left
" it opens a new blank one
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" undos
set undolevels=1000	

" highlight current line 
set cursorline

" plugs
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'tpope/vim-commentary' " gcc to comment a line, gc to comment a bloc in visual mode
Plug 'tomasiser/vim-code-dark'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'valloric/python-indent'
Plug 'tpope/vim-abolish'
Plug 'kkoomen/vim-doge', { 'tag' : 'v3.10.0', 'do': { -> doge#install() } }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

call plug#end()

" color scheme
let g:gruvbox_italics=1

set t_Co=256
set t_ut=

" Function that switches between light and dark
function! GruvboxAutoSwitch()
  let l:hour = str2nr(strftime("%H"))

  if l:hour < 21
    set background=light
  else
    set background=dark
  endif

  colorscheme gruvbox
endfunction

" Run the switch at startup
autocmd VimEnter * call GruvboxAutoSwitch()

let g:lightline = {
            \ 'active': {
            \    'left': [ [ 'mode', 'paste' ],
            \              [ 'filename', 'modified' ],
            \              [ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ],
            \              [ 'coc-status' ]]
            \ }
            \ }

call lightline#coc#register()

" syntax highlighting
let g:python_highlight_all = 1

" coc settings
nmap <leader>f <Plug>(coc-format-selected)

nmap gd <Plug>(coc-definition)
nmap gsd :vsp<CR><Plug>(coc-definition)

nmap gr <Plug>(coc-references)

nmap gy <Plug>(coc-type-definition)
nmap gsy :vsp<CR><Plug>(coc-type-definition)

nmap gi <Plug>(coc-implementation)
nmap gsi :vsp<CR><Plug>(coc-implementation)

nmap gr <Plug>(coc-references)
nmap gsr :vsp<CR><Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

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

" fzf settings
let g:fzf_preview_window = []
nnoremap <C-F> :Files<CR>

" italics in tmux
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
