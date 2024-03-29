call plug#begin()
 Plug 'preservim/nerdtree'
 Plug 'dracula/vim', { 'as': 'dracula' }
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'mileszs/ack.vim'
call plug#end()

" Change default map leader to <Space>
let mapleader = "\<Space>"

" Source Vim configuration file and install plugins leader 1
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Set the color scheme ()
colorscheme dracula

" Enable syntax highlighting
syntax on

" Enable line numbers
set number

" Enable mouse support
set mouse=a

" Set tabstop, shiftwidth, and expandtab for consistent indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Highlight search results as you type
set incsearch

" Highlight matching parentheses
set showmatch

" Enable filetype detection and plugins
filetype plugin indent on

" Display the cursor position in the status line
set ruler

" Blink cursor on error instead of beeping
set visualbell

" Enable auto-indentation
set autoindent

" Encoding
set encoding=utf-8

" Enable smart indenting for programming languages
set smartindent

" Set the terminal emulator to xterm-256color
set term=xterm-256color

" Define mappings for easier navigation in split screens
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Hide buffers instead of closing them
set hidden

" Show all buffers with leader b
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Define mappings for easier buffer switching
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>

" Enable line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set linebreak

" Enable incremental search highlighting
set hlsearch

" Highlight only whole words when searching
set smartcase

" remove vi compatible functions
set nocompatible
" Enable filetype-specific settings and plugins
filetype plugin indent on

" Change esc to jk mappings
inoremap jk <Esc>
vnoremap jk <Esc>

" Auto close brackets and quotes
inoremap { {}<ESC>ha
inoremap ( ()<ESC>ha
inoremap [ []<ESC>ha
inoremap " ""<ESC>ha
inoremap ' ''<ESC>ha

"Yank to clipboard 
vnoremap y "*y
nnoremap yy "*yy

" Set minimum # of screen lines when scrolling
set scrolloff=3
" Display current mode 
set showmode
" Shows incomplete command you are typing
set showcmd

" Enables command-line completion
set wildmenu
set wildmode=list:longest

" Highlights current line
set cursorline

" Improve VIM Performance
set ttyfast

" Always show status line 
set laststatus=2

" Relative line number instead
set relativenumber

" Persisting undo
set undofile

" Fix regex handling
nnoremap / /\v
vnoremap / /\v

" Search ignore case
set ignorecase

" Makes :s (substitute) replace all values in a line
set gdefault

" leader <space> for no highlight
nnoremap <leader><space> :noh<cr>

" leader <t> for toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>

" auto reload NERDTree on directory structure changes
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

" close if NERDtree is the only open tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" auto referesh NERDTree on cwd change
augroup DIRCHANGE
 au!
 autocmd DirChanged global :NERDTreeCWD
augroup END

" <tab> to move to next bracket pair
nnoremap <tab> %
vnoremap <tab> %

" make it easier to access other commands
nnoremap ; :

" new vertical split
nnoremap <leader>w <C-w>v<C-w>l

" On write, remove all duplicate consecutive lines
autocmd BufWritePost * silent! %s/^\(.*\)\(\n\1\)\+$/\1/ | silent noautocmd w

" Set FZF window layout to always pop up at the bottom
let g:fzf_layout = { 'down': '40%'}

" Set FZF Gfiles to ctrl g
nnoremap <leader>g :GFiles<Cr>

" Add ag (silver searcher) to ack.vim
let g:ackprg = 'ag --vimgrep'

" Search in files with leader+f
nnoremap <leader>f :Ag<Cr>
