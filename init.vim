call plug#begin()
 " Plugin Section
 Plug 'morhetz/gruvbox'
 Plug 'ryanoasis/vim-devicons'
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'hrsh7th/nvim-cmp'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'sheerun/vim-polyglot'
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 Plug 'honza/vim-snippets'
 Plug 'prettier/vim-prettier'
 Plug 'terryma/vim-multiple-cursors'
 Plug 'davidhalter/jedi-vim'
call plug#end()

" configuration
set nocompatible          " disable compatibility to old-time vi
set showmatch             " show matching
set ignorecase            " case insensitive
set mouse=v               " middle-click paste with
set hlsearch              " highlight search
set incsearch             " incremental search
set tabstop=2             " number of columns occupied by a tab
set softtabstop=2         " see multiple spaces as tabstops so <BS> does the right thing
set expandtab             " converts tabs to white space
set shiftwidth=2          " width for autoindents
set smartindent           " Makes indenting smart
set autoindent            " indent a new line the same amount as the line just typed
set smarttab              " Makes tabbing smarter will realize you have 2 vs 4
set number                " add line numbers
" toggle relative number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" set foldmethod according to a file type
augroup foldingmethod
  autocmd FileType c setlocal foldmethod=syntax
  autocmd FileType cpp setlocal foldmethod=syntax
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType ruby setlocal foldmethod=indent
augroup END

set cc=80                 " set an 80 column border for good coding style
filetype plugin indent on "allow auto-indenting depending on file type
syntax on                 " syntax highlighting
set mouse=a               " enable mouse click
set clipboard=unnamedplus " using system clipboard
filetype plugin on
set ttyfast               " Speed up scrolling in Vim
set hidden                " enable change buffers without saving
set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
set cursorline            " highlight cursor line
set splitright            " Vertical splits will automatically be to the right
set nobackup              " This is recommended by coc
set nowritebackup         " This is recommended by coc
set updatetime=300        " Faster completion
set formatoptions-=cro    " Stop newline continution of comments
set scrolloff=5           " Start scroll 5 lines from the edges


set background=dark
set t_Co=256
colorscheme gruvbox

" ----- MAPS ----
nnoremap <S-Tab> :bp<cr>
nnoremap <S-w> :bn<cr>
nnoremap <C-q> :bp<bar>sp<bar>bn<bar>bd<cr>

nnoremap <C-l> :NERDTreeToggle<cr>

" escape to normal mode
inoremap jj <esc>
inoremap kk <esc>
inoremap kj <esc>
inoremap jk <esc>

" move lines
inoremap <A-j> <esc>:m+1<cr>i
inoremap <A-down> <esc>:m+1<cr>i
inoremap <A-k> <esc>:m-2<cr>i
inoremap <A-up> <esc>:m-2<cr>i
nnoremap <A-j> :m+1<cr>
nnoremap <A-down> :m+1<cr>
nnoremap <A-k> :m-2<cr>
nnoremap <A-up> :m-2<cr>

" move splits
nnoremap <C-up> <C-w>k<cr>
nnoremap <C-down> <C-w>j<cr>
nnoremap <C-right> <C-w>l<cr>
nnoremap <C-left> <C-w>h<cr>

" comments
nmap <C-_> <Bslash>c<space>


" ----- Airline -----
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '◤'
let g:airline#extensions#tabline#right_sep = '◥'
"let g:airline#extensions#tabline#left_alt_sep = '⎠'
let g:airline#extensions#tabline#left_alt_sep = '╱'
"let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

let g:airline_left_sep = '◣'
let g:airline_right_sep = '◢'

let g:airline_left_alt_sep = '╲'
let g:airline_right_alt_sep = '╱'

" ----- Ultisnips -----
" ----- Commenter -----
let g:NERDSpaceDelim = 2
let g:NERDCompactSexyComs = 1

" ----- Prettier -----
let g:prettier#autoformat_require_pragma = 0

