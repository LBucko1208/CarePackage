" ====================
" GENERAL SETTINGS:
" Enable line numbers
set number
set relativenumber

"" Set look of vim (comment out if not wanted)
set guifont=Consolas:h10
set guioptions-=T
colorscheme industry
syntax on

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
set clipboard+=unnamed

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

" Compatibility with tmux
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" ====================
" REMAPS:

" Map leader to <Space>
let mapleader = " "

" Bind <Home> button to move to first non-blank character
noremap <Home> ^
inoremap <Home> <Esc>^i

" Bind for saving and :noh
noremap <Leader>s :w<CR>
noremap <Leader>h :noh<CR>

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
noremap <Leader><C-Left> 20<C-w><
noremap <Leader><C-Down> 10<C-w>-
noremap <Leader><C-Up> 10<C-w>+
noremap <Leader><C-Right> 20<C-w>>

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

" Binds for copying and deleting whole files
noremap yaa mtggyG`t
noremap daa ggdG
noremap vaa mtggVG

" ====================
"" SNIPPETS:
"nnoremap ,jspheader :-1read $HOME/.vimsnippets/.jspheader<CR>
"nnoremap ,servlet :-1read $HOME/.vimsnippets/.servlet<CR>
