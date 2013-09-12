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
let mapleader=";"

set tags=tags;/

"status line setting
set laststatus=2


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
Bundle 'itchyny/lightline.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'flazz/vim-colorschemes'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Rykka/riv.vim'
Bundle 'nvie/vim-flake8'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/grep.vim'

execute pathogen#infect()

"Map Tabularize Plug-in
nmap <leader>k :Tabularize /=

"Tag bar
let g:tagbar_left=1
let g:tagbar_foldlevel =0 
nmap <F8> :TagbarToggle<CR>

"Color scheme Setting 
colorscheme jelleybeans

"Switch Past mode  with F2
set pastetoggle=<F2>

nnoremap <silent> <F3> :Rgrep<CR>

"Lingt line setting 
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr> 

"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber
