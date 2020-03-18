let mapleader = ","

" for running python files
nnoremap <leader>pm :!python3 main.py<CR>
nnoremap <leader>pc :!python3 %<CR>
nnoremap <leader>li :w<CR>:!mypy %<CR>

" for edditing .vimrc
nnoremap <silent> <leader>ev :w<CR>:e ~/.vimrc<CR>
nnoremap <leader>rv :w<CR>:so ~/.vimrc<CR>

" for realoding plugins
nnoremap <silent> <leader>lp :PlugUpdate<CR>
nnoremap <silent> <leader>cp :PlugClean<CR>

" select and copy all texts
map <C-a> <esc>ggVG"+y

" ditraction free writting toogeling
nnoremap <silent> <leader>df :Goyo<CR>

" Toogle indent lines
nnoremap <silent> <leader>ti :IndentLinesToggle<CR>


function! AddImport()
	let module = expand("<cword>")
	call append(0, "import " . module)
endfunction

nnoremap <silent> <leader>im :call AddImport()<CR>

call plug#begin('~/.vim/plugged')

" colerscheme
Plug 'kaicataldo/material.vim'

" indent lines for python coding 
Plug 'yggdroot/indentline'

" distraction free writting
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" rainbow-brackets
Plug 'frazrepo/vim-rainbow'

" status line
Plug 'itchyny/lightline.vim'

" better commenting
Plug 'preservim/nerdcommenter'

call plug#end()

" colorscheme config
let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 1
colorscheme material
if (has("termguicolors"))
  set termguicolors
endif

" Indent line config
let g:indentLine_char_list = ["|", "I"]

" limelight config
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" rainbow-brackets config
let g:rainbow_active = 1

" status line config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
