" Basic settings:
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" Enabling auto completion: 
set wildmode=longest,list,full

" Disabling auto comments on new lines:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right:
set splitbelow splitright
" + Remapping split navigation keys to vim hjkl
map <C-h> <C-w>h 
map <C-j> <C-w>j 
map <C-k> <C-w>k 
map <C-l> <C-w>l 
" ------------------------------------

" Installing vim-plug automatically:
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim/'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" Calling plugins:
call plug#begin('~/.vim/plugins/plugged')
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/xuhdev/vim-latex-live-preview.git', { 'for': 'tex' }
Plug 'https://github.com/voldikss/vim-floaterm.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/junegunn/goyo.vim.git'
call plug#end()
" ------------------------------------------------------
" PDF-live-viewer:

let g:livepreview_previewer = 'evince'
let g:livepreview_engine    = 'pdflatex'

" Binding keys:
nnoremap <SPACE> <Nop>
let mapleader=" "

map <leader>s :!clear && shellcheck %<CR>
nnoremap S :%s///g<Left><Left>
map <leader>n :NERDTree<CR>
let g:floaterm_keymap_new = '<Leader>ft'
let g:floaterm_keymap_toggle = '<Leader>t'
map <leader>g :Goyo \| set linebreak<CR>
