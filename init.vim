" PLUGINS {{{
call plug#begin()
  " Plugin Section
  Plug 'dense-analysis/ale'                            " ALE is a plugin providing linting (syntax checking and semantic errors)
  Plug 'APZelos/blamer.nvim'                           " A git blame plugin for (neo)vim inspired by VS Code's GitLens plugin.
  Plug 'neoclide/coc.nvim', {'branch': 'release'}      " It's an intellisense engine for vim8 & neovim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Things you can do with fzf and Vim.
  Plug 'junegunn/fzf.vim'                              " fzf is a general-purpose command-line fuzzy finder.
  Plug 'morhetz/gruvbox'                               " gruvbox colorscheme
  Plug 'davidhalter/jedi-vim'                          " awesome Python autocompletion with VIM
  Plug 'preservim/nerdcommenter'                       " Comment functions so powerful—no comment necessary
  Plug 'scrooloose/nerdtree'                           " file tree navigate
  " Plug 'hrsh7th/nvim-cmp'                             " A completion engine plugin for neovim written in Lua
  Plug 'nvim-lua/plenary.nvim'                         " All the lua functions I don't want to write twice. (REQUIRE by other plugins)
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
  Plug 'tpope/vim-surround'                            " Delete/change/add parentheses/quotes/XML-tags/much more with ease
  Plug 'mg979/vim-visual-multi'                        " A better visual mode
  Plug 'nvim-neorg/neorg'                              " Modernity meets insane extensibility. The future of organizing your life in Neovim
call plug#end()
" }}}

" configuration {{{
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
" }}}

" colorscheme {{{
set background=dark
set t_Co=256
colorscheme gruvbox
" }}}

" toggle relative number {{{
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
" }}}

" set foldmethod according to a file type {{{
augroup foldingmethod
  autocmd FileType c setlocal foldmethod=syntax
  autocmd FileType cpp setlocal foldmethod=syntax
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType ruby setlocal foldmethod=indent
  autocmd FileType yaml setlocal foldmethod=indent
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" ----- set leader -----
let mapleader = " "

" ----- MAPS ----- {{{
" buffers motions {{{
nnoremap <S-Tab> :bp<cr>
nnoremap <S-w> :bn<cr>
nnoremap [b :bp<cr>
nnoremap ]b :bn<cr>
nnoremap <C-q> :bp<bar>sp<bar>bn<bar>bd<cr>
" }}}

" terminal emulator {{{
tnoremap <esc> <c-\><c-n>
" }}}

" file explorer, tagbar and blame toggle {{{
nnoremap cd :NERDTreeFind<cr>
nnoremap <C-l> :NERDTreeToggle<cr>
nnoremap <C-k> :Tagbar<cr>
nnoremap <leader>b :BlamerToggle<cr>
" }}}

" spatial mode changes {{{
nnoremap <leader>i ea
nnoremap <leader>a ea
nnoremap <leader>t :terminal<cr>
" }}}

" escape to normal mode {{{
inoremap jj <esc>
inoremap kk <esc>
inoremap kj <esc>
inoremap jk <esc>
" }}}

" clean search and search current word {{{
nnoremap <esc> :noh<CR><esc>
nnoremap <leader>h :let @/='\<<C-R>=expand("<cword>")<cr>\>'<cr>
" }}}

" move lines {{{
inoremap <A-j> <esc>:m+1<cr>i
inoremap <A-down> <esc>:m+1<cr>i
inoremap <A-k> <esc>:m-2<cr>i
inoremap <A-up> <esc>:m-2<cr>i
nnoremap <A-j> :m+1<cr>
nnoremap <A-down> :m+1<cr>
nnoremap <A-k> :m-2<cr>
nnoremap <A-up> :m-2<cr>
" }}}

" move splits {{{
nnoremap <C-up> <C-w>k<cr>
nnoremap <C-down> <C-w>j<cr>
nnoremap <C-right> <C-w>l<cr>
nnoremap <C-left> <C-w>h<cr>
" }}}

" git hunk jump {{{
nnoremap ]h :GitGutterNextHunk<cr>
nnoremap [h :GitGutterPrevHunk<cr>
" }}}

" quickfix result jump {{{
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>
"}}}

" fix indent {{{
nnoremap <leader>g gg<S-v>G=<C-o>
" }}}

" --- cases toggle --- " {{{
nnoremap <leader>s viw:call CaseToggle()<cr>

function! CaseToggle()
  let w = getline('.')[getpos("'<")[2] - 1:getpos("'>")[2] - 1]
  if len(split(w, '_')) > 1
    sil!  s/\%V_\(.\)/\u\1/g
  else
    sil! s/\%V\u/_\l\0/g
  endif
endfunction
"}}}

" --- automatic-closing-brackets --- " {{{
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

function! Close_par(chr) " {{{
  let char = getline('.')[col('.')]
  if char == a:chr
    exe "normal! l"
    return
  else
    exe "normal! a".a:chr."\<Esc>"
  endif
endfunction
" }}}
" }}}

" --- FZF fuzzy finder --- {{{
nnoremap <leader>F :Files<cr>
nnoremap <leader>M :Marks<cr>
nnoremap <leader>T :Tags <C-r><C-w><cr>
nnoremap <leader>G :GGrep <C-r><C-w><cr>
"}}}

"}}}

" ----- Airline ----- {{{
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
" }}}

" ----- ALE ----- {{{
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

autocmd FileType ruby let ale_fix_on_save = 0
" }}}

" ----- COC-nvim -----{{{
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}

" ----- Commenter ----- {{{
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" commenter maps
nnoremap <C-_> :call nerdcommenter#Comment('n', 'Toggle')<cr>
inoremap <C-_> <esc>:call nerdcommenter#Comment('n', 'Toggle')<cr>i
vnoremap <C-_> <esc>:call nerdcommenter#Comment('nx', 'Toggle')<cr>
" }}}

" ----- Prettier ----- {{{
let g:prettier#autoformat_require_pragma = 0
" }}}

" ----- FZF ----- {{{
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
"}}}
