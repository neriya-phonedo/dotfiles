call plug#begin()
 " Plugin Section
 Plug 'morhetz/gruvbox'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'sheerun/vim-polyglot'
 Plug 'tpope/vim-fugitive'
call plug#end()

" configuration
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
" toggle relative number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

"set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set hidden                  " enable change buffers without saving

set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

set background=dark
set t_Co=256
colorscheme gruvbox

" ----- MAPS ----
nnoremap <S-Tab> :bp<cr>
nnoremap <S-w> :bn<cr>
nnoremap <C-q> :bp<bar>sp<bar>bn<bar>bd<cr>


" ----- Airline -----
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '◤'
let g:airline#extensions#tabline#right_sep = '◥'
let g:airline#extensions#tabline#left_alt_sep = '⎠'
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
