" for running python files
nnoremap pm :!python3 main.py<CR>
nnoremap pc :!python3 %<CR>

" for edditing .vimrc
nnoremap <silent> ev :e ~/.vimrc<CR>
nnoremap rv :w<CR>:so ~/.vimrc<CR>

" for realoding plugins
nnoremap <silent> lp :PlugUpdate<CR>
nnoremap <silent> cp :PlugClean<CR>

call plug#begin('~/.vim/plugged')

" colerscheme
Plug 'kaicataldo/material.vim'

" indent lines for python coding 
Plug 'yggdroot/indentline'

call plug#end()

" colorscheme config
let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 1
colorscheme material
if (has("termguicolors"))
  set termguicolors
endif

" Indent line config
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nnoremap <silent> ti :IndentLinesToggle<CR>

