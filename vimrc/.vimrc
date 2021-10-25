" Enable line numbers
set number

" Set tab to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Enable autoindent
set autoindent

" Enable backspace to work as it should
set backspace=indent,eol,start

"" Set look of vim (comment out if not wanted)
" set guifont=Consolas:h10
" set guioptions-=T
" colorscheme industry
" syntax on

" Set default register to system clipboard
set clipboard=unnamedplus

" Set encoding to UTF-8 (prikazivanje palatala)
set encoding=utf-8
set fileencoding=utf-8

" Bind <Space> to insert new line in normal mode
noremap <Space> o<Esc>


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

" inoremap [ []<Left>
" inoremap [] []
" inoremap [[ [

inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>O
inoremap () ()
inoremap (( (

" inoremap < <><Left>
" inoremap <> <>
" inoremap << <


" Tools for drawing tables
map <Leader>q R+---+<Esc>
map <Leader>w R+-----+<Esc>
map <Leader>f R+-----------+<Esc>
map <Leader>p R+-----------------------+<Esc>
map <Leader>a R\|   \|<Esc>
map <Leader>r R\|     \|<Esc>
map <Leader>s R\|           \|<Esc>
map <Leader>t R\|                       \|<Esc>
