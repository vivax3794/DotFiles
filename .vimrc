"I was recommended this one
let mapleader = ","

" for running python files
nnoremap <leader>pm :w<CR>:!python3 main.py<CR>
nnoremap <leader>p-m :w<CR>:!python3 __main__.py<CR>
nnoremap <leader>pt :w<CR>:!python3 testing.py<CR>
nnoremap <leader>pe :w<CR>:!python3 eksample.py<CR>
nnoremap <leader>pc :w<CR>:!python3 %<CR>
nnoremap <leader>li :w<CR>:!mypy %<CR>

" for edditing .vimrc
nnoremap <silent> <leader>ev :w<CR>:e ~/.vimrc<CR>
nnoremap <leader>rv :w<CR>:so ~/.vimrc<CR>

" for realoding plugins
nnoremap <silent> <leader>lp :PlugUpdate<CR>
nnoremap <silent> <leader>cp :PlugClean<CR>

" select and copy all texts
nnoremap  <leader>ya ggVG"+y

" ditraction free writting toogeling
nnoremap <silent> <leader>df :Goyo<CR>

" Toogle indent lines
nnoremap <silent> <leader>ti :IndentLinesToggle<CR>

" function and shortcut to add "import <word under cursor" to the top of the
" file
function! AddImport()
	let module = expand("<cword>")
	call append(0, "import " . module)
endfunction

nnoremap <silent> <leader>im :call AddImport()<CR>

" toogle file view
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" remove all swap files
nnoremap <leader>rs :!rm ~/.local/share/nvim/swap/*<CR>



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

" file manager
Plug 'preservim/nerdtree'

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

" NERD tree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
