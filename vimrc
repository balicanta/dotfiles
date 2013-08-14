syntax on
set nu
set nobackup                          " no *~ backup files
set noswapfile
set nowritebackup
set copyindent                        " copy the previous indentation on autoindenting
set ignorecase                        " ignore case when searching
set smartcase
set smarttab                          " insert tabs on the start of a line according to
set expandtab                         " replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4
set autoindent
set shortmess=Ia                      " remove splash wording
set ruler

set hidden
set viminfo='1025,f1,%1024

set tags=tags;/

"status line setting
set laststatus=2

set statusline=%t       "tail of the filename

"Auto indent
filetype plugin indent on

" file encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le,latin1
set fenc=utf-8 enc=utf-8 tenc=utf-8
scriptencoding utf-8

"=================Map Key==================

" remap VIM 0
map 0 ^ 

" return current opened file's dirctory
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" quick open vimrc in a new tab
nmap <leader>v :tabe $MYVIMRC<CR>

" quick open Unite 
nnoremap <leader>r :<C-u>Unite -start-insert file_rec buffer<CR>

"Mapping Tab to Esc on every mode
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>

" Run Python with Shift+e
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

"==============Plug-in================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'Shougo/unite.vim'
Bundle 'tpope/vim-surround'
Bundle 'gmarik/vundle'
Bundle 'python.vim'
Bundle 'pyflakes.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'bufexplorer.zip'
Bundle 'groenewege/vim-less'
Bundle 'lastpos.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'flazz/vim-colorschemes'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Rykka/riv.vim'
Bundle 'nvie/vim-flake8'
Bundle 'taglist.vim'

execute pathogen#infect()

"Map Tabularize Plug-in
nmap <leader>k :Tabularize /=
