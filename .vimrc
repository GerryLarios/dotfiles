" Basics
set encoding=utf-8 " The encoding displayed.
set fileencoding=utf-8 " The encoding written to file
set noshowmode " Does not show [MODE]; task delegates to lightline
set laststatus=2 " Always show the status line from the last window
syntax on " Syntax highlight from vim
set number " Precede each line with its number
set wildmenu "On pressing 'wildchar' (usually <Tab>) to invoke completion on command-line
set wildmode=list:full " List all matches and complete first match
set title " Show if a file is being edited

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" Moving with tabs
nnoremap tn :tabnew<Space>

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Moving with splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Wakatime
Plugin 'wakatime/vim-wakatime'
" Vim Tmux navigator
Plugin 'christoomey/vim-tmux-navigator'
" NerdTREE
Plugin 'preservim/nerdtree'
" Onedark theme
Plugin 'joshdick/onedark.vim'
" Lightline
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
" Polygot
Plugin 'sheerun/vim-polyglot'
" Ruby
Plugin 'tpope/vim-endwise' " Put end
Plugin 'tpope/vim-commentary' " Comment lines
Plugin 'jiangmiao/auto-pairs' " Auto pairs
Plugin 'ycm-core/YouCompleteMe' " Auto complatation
Plugin 'junegunn/fzf' " File finder
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Fzf ctrp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" Tmux VIM navigator
let g:tmux_navigator_no_mappings = 1

" NerdTree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" dark theme
set t_Co=256
set cursorline
colorscheme onedark
let g:airline_theme='onedark'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Lightline
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
  \ }

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
