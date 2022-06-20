" PLUGINS {{{
call plug#begin()
  " Plugin Section
  Plug 'dense-analysis/ale'                            " ALE is a plugin providing linting (syntax checking and semantic errors)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}      " It's an intellisense engine for vim8 & neovim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Things you can do with fzf and Vim.
  Plug 'junegunn/fzf.vim'                              " fzf is a general-purpose command-line fuzzy finder.
  Plug 'morhetz/gruvbox'                               " gruvbox colorscheme
  Plug 'davidhalter/jedi-vim'                          " awesome Python autocompletion with VIM
  Plug 'preservim/nerdcommenter'                       " Comment functions so powerful—no comment necessary
  Plug 'scrooloose/nerdtree'                           " file tree navigate
  " Plug 'hrsh7th/nvim-cmp'                             " A completion engine plugin for neovim written in Lua
  Plug 'preservim/tagbar'                              " Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file
  Plug 'SirVer/ultisnips'                              " snippets
  Plug 'vim-airline/vim-airline'                       " Lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline-themes'                " This is the official theme repository for vim-airline
  Plug 'ryanoasis/vim-devicons'                        " files icons
  Plug 'tpope/vim-fugitive'                            " Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim
  Plug 'airblade/vim-gitgutter'                        " A Vim plugin which shows a git diff in the sign column and more
  Plug 'ludovicchabant/vim-gutentags'                  " A Vim plugin that manages your tag files
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'       " more files icons
  Plug 'sheerun/vim-polyglot'                          " A collection of language packs for Vim
  Plug 'prettier/vim-prettier'                         " A vim plugin wrapper for prettier, pre-configured with custom default prettier settings.
  Plug 'honza/vim-snippets'                            " snippets
  Plug 'mg979/vim-visual-multi'                        " A better visual mode
call plug#end()
" }}}

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
set foldopen=block        " Open fold block

" colorscheme
set background=dark
set t_Co=256
colorscheme gruvbox

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

" ----- set leader -----
let mapleader = " "

" ----- MAPS ----
nnoremap <S-Tab> :bp<cr>
nnoremap <S-w> :bn<cr>
nnoremap <C-q> :bp<bar>sp<bar>bn<bar>bd<cr>

nnoremap cd :NERDTreeFind<cr>
nnoremap <C-l> :NERDTreeToggle<cr>
nnoremap <C-k> :Tagbar<cr>

" spatial mode changes
nnoremap <leader>i ea
nnoremap <leader>a ea


" escape to normal mode
inoremap jj <esc>
inoremap kk <esc>
inoremap kj <esc>
inoremap jk <esc>

" clean search
nnoremap <esc> :noh<CR><esc>

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
nnoremap <C-_> :call nerdcommenter#Comment('n', 'Toggle')<cr>

" search current word
nnoremap <leader>h :let @/='\<<C-R>=expand("<cword>")<cr>\>'<cr>n<cr>

" fix indent
nnoremap <leader>g gg<S-v>G=<C-o>

" --- cases change --- "
" camel to snake
nnoremap <leader>s viw:s/\%V\u/_\l\0/g<cr>
" snake to camel
nnoremap <leader>c viw:s/\%V_\(.\)/\u\1/g<cr>


" ---------- automatic-closing-brackets ---------- "
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

vnoremap " :s/\%V\(.*\)\%V/"\1"/<CR>
vnoremap ' :s/\%V\(.*\)\%V/'\1'/<CR>
vnoremap ( :s/\%V\(.*\)\%V/(\1)/<CR>
vnoremap [ :s/\%V\(.*\)\%V/[\1]/<CR>
vnoremap { :s/\%V\(.*\)\%V/{\1}/<CR>

inoremap ) <Esc>:call Close_par(")")<CR>a
inoremap } <Esc>:call Close_par("}")<CR>a
inoremap ] <Esc>:call Close_par("]")<CR>a

function! Close_par(chr)
  let char = getline('.')[col('.')]
  if char == a:chr
    exe "normal! l"
    return
  else
    exe "normal! a".a:chr."\<Esc>"
  endif
endfunction

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

" ----- ALE -----
" ALE map
nnoremap ]e :ALENext<CR>
nnoremap [e :ALEPrevious<CR>
nnoremap <leader>f :ALEFix<CR>

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': [
      \   'add_blank_lines_for_python_control_statements',
      \   'autoflake',
      \   'autoimport',
      \   'black',
      \   'isort',
      \   'yapf',
      \   'autopep8',
      \ ],
      \ 'ruby': ['rubocop', 'sorbet'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'json': ['prettier']
      \}

let g:ale_fix_on_save = 1

" ----- Ultisnips -----
" ----- Commenter -----
let g:NERDSpaceDelim = 2
let g:NERDCompactSexyComs = 1

" ----- Prettier -----
let g:prettier#autoformat_require_pragma = 0
