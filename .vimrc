" I was recommended this one
let mapleader = ","

" ignore case
set ignorecase

" for running python files
let main_python_file="main.py"
function! RunMainFile()
	execute "!python3 " . g:main_python_file
endfunction
nnoremap <leader>pm :w<CR>:call RunMainFile()<CR>
nnoremap <leader>psm :let main_python_file=expand("%")<CR>
autocmd FileType python nnoremap <buffer> <leader>pc :w<CR>:!python3 %<CR>

" for linting python files
nnoremap <silent> <leader>fl :ALEFix<CR>

" for edditing .vimrc
nnoremap <silent> <leader>ev :w<CR>:e ~/.vimrc<CR>
nnoremap <leader>rv :w<CR>:so ~/.vimrc<CR>

" for realoding plugins
nnoremap <silent> <leader>lp :PlugUpdate<CR>
nnoremap <silent> <leader>cp :PlugClean<CR>

" copy and pasting
nnoremap <leader>ya ggVG"+y
xnoremap <leader>yl "+y
nnoremap <leader>pl "+p

" delete everything
nnoremap <leader>da ggVGd
" ditraction free writting toogeling
nnoremap <silent> <leader>df :Goyo<CR>

" Toogle indent lines
nnoremap <silent> <leader>ti :IndentLinesToggle<CR>

" function and shortcut to add "import <word under cursor>" to the top of the
" file
function! AddImport()
	let module = expand("<cword>")
	call append(0, "import " . module)
endfunction

nnoremap <silent> <leader>im :call AddImport()<CR>

" toogle file view
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
autocmd FileType nerdtree nmap <buffer> l o

" remove all swap files
nnoremap <leader>rs :!rm ~/.local/share/nvim/swap/*<CR>

" turn of hilighting after a search
nnoremap <leader>h :noh<CR>

" Strip whitespace
nnoremap <leader>sw :StripWhitespace<CR>

" spelling settings
autocmd FileType markdown set spell
nnoremap <silent> <leader>sc [sz=
nnoremap <silent> <leader>sn :set spell<CR>
nnoremap <silent> <leader>sf :set nospell<CR>

" Aligning
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" windows
nnoremap <silent> <leader>qw <C-w>w:q<CR>
nnore <leader>w <C-w>w

nnoremap <silent> <leader>syn :syntax on<CR>
nnoremap <silent> <leader>syf :syntax off<CR>

" some reason I dont have higlithing on xml by deafult
autocmd FileType xml syntax on
autocmd FileType haskell syntax enable
autocmd FileType cabal syntax enable
autocmd FileType haskell set expandtab

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

" better whitespace
Plug 'ntpeters/vim-better-whitespace'

" Git marks in the left side.
Plug 'airblade/vim-gitgutter'

" bracket matching
Plug 'jiangmiao/auto-pairs'

" Better movimg
Plug 'easymotion/vim-easymotion'

" Align stuff
Plug 'junegunn/vim-easy-align'

" Searching
Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

" Log files
Plug 'mtdl9/vim-log-highlighting'

" git stuff
Plug 'tpope/vim-fugitive'

Plug 'elzr/vim-json'

Plug 'dense-analysis/ale'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'deoplete-plugins/deoplete-jedi'
Plug 'tweekmonster/deoplete-clang2'

call plug#end()

" linenumbers config
set number
set relativenumber

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

" Searching options
nmap / <Plug>(AerojumpBolt)

" linting
let b:ale_fixers = ['black']

let g:deoplete#enable_at_startup = 1
