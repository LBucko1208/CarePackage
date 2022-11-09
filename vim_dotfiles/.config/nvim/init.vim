set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" --------------------
"" WSL Copy/Paste integration
let g:clipboard = {
                \   'name': 'WslClipboard',
                \   'copy': {
                \      '+': '/mnt/c/Repos/CarePackage/vim_dotfiles/win32yank.exe -i --crlf',
                \      '*': '/mnt/c/Repos/CarePackage/vim_dotfiles/win32yank.exe -i --crlf',
                \    },
                \   'paste': {
                \      '+': '/mnt/c/Repos/CarePackage/vim_dotfiles/win32yank.exe -o --lf',
                \      '*': '/mnt/c/Repos/CarePackage/vim_dotfiles/win32yank.exe -o --lf',
                \   },
                \   'cache_enabled': 0,
                \ }


" PLUGINS
" ====================
"" NERDTree:
" --------------------
"" Map Tree to <Alt+q>
nnoremap <M-q> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen=1

