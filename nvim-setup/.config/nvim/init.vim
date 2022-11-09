set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" PLUGINS
" ====================
"" NERDTree:
" --------------------
"" Map Tree to <Alt+q>
nnoremap <M-q> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen=1

