" PLUGINS:
set nocompatible
filetype off

set rtp+=~/vimfiles/bundle/vundle/

"" Import plugins
"call vundle#begin()
"
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-surround'
"Plugin 'mattn/emmet-vim'
"Plugin 'preservim/nerdtree'
"Plugin 'bling/vim-bufferline'
"Plugin 'tpope/vim-commentary'
"
"call vundle#end()
"filetype plugin indent on

" ====================
"" NERDTree:
"nnoremap <M-1> :NERDTreeToggle<CR>

" ====================
" GENERAL SETTINGS:
" Enable line numbers
set number
set relativenumber

" Set padding when moving around
set so=10

" Wildmenu for autocompletion
set nowildmenu
set wildmode=list:full

" Set tab to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Enable autoindent
set autoindent

" Enable backspace to work as it should
set backspace=indent,eol,start

" Set default register to system clipboard
set clipboard=unnamedplus

" Set encoding to UTF-8 (prikazivanje palatala)
set encoding=utf-8
set fileencoding=utf-8

" Automatically refresh file when it changes
set autoread

" Show commands
set showcmd

" File searching
set path=,,**
set wildignore+=**/target/**

" Bind for scrolling with mouse wheel
" And also better mouse control in vim
set mouse=a

" ====================
" REMAPS:
" Bind <Space> to insert new line in normal mode
noremap <Space> :w<CR>

" Bind <Home> button to move to first non-blank character
noremap <Home> ^
inoremap <Home> <Esc>^i

" Bind for changing buffers
noremap <Leader>y :bn<CR>
noremap <Leader>l :bp<CR>

" Bind for closing buffer
noremap <Leader>d :bd<CR>

" Bind for changing windows
noremap <Leader>n <C-w>h
noremap <Leader>e <C-w>j
noremap <Leader>u <C-w>k
noremap <Leader>i <C-w>l

" Bind for changing window size (vidjet za ovo!!)
" noremap <Leader><C-n> 20<C-w><
" noremap <Leader><C-e> 10<C-w>-
" noremap <Leader><C-u> 10<C-w>+
" noremap <Leader><C-i> 20<C-w>>

" Bind <Control> + arrows to move further
noremap <C-Up> 10<Up>
noremap <C-Down> 10<Down>

" Bind keys to insert a matching pair
" Bind keys to insert speed up adding empty key pair
" Bind keys to insert a single when two are input
inoremap ' ''<Left>
inoremap '' '

inoremap " ""<Left>
inoremap "" "

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {} {}
inoremap {{ {

"inoremap [ []<Left>
"inoremap [] []
"inoremap [[ [

inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>O
inoremap () ()
inoremap (( (

"inoremap < <><Left>
"inoremap <> <>
"inoremap << <

" Tools for drawing tables
"map <Leader>q R+---+<Esc>
"map <Leader>w R+-----+<Esc>
"map <Leader>f R+-----------+<Esc>
"map <Leader>p R+-----------------------+<Esc>
"map <Leader>a R\|   \|<Esc>
"map <Leader>r R\|     \|<Esc>
"map <Leader>s R\|           \|<Esc>
"map <Leader>t R\|                       \|<Esc>

" Binds for copying and deleting whole files
noremap yaa mtggyG`t
noremap daa mtggdG`t
noremap vaa mtggVG

" ====================
" SNIPPETS:
nnoremap ,jspheader :-1read $HOME/.vimsnippets/.jspheader<CR>
nnoremap ,servlet :-1read $HOME/.vimsnippets/.servlet<CR>

