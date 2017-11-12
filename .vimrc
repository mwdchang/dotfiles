set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle related things
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'

" A better file explorer
Plugin 'scrooloose/nerdTree'


call vundle#end()       
filetype plugin indent on




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
set nu
set nowrap
syn on
filetype plugin indent on



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and spaces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable swap files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup       " no backup files
set nowritebackup  " only in case you don't want a backup file while editing
set noswapfile     " no swap files



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocomplete and things
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildignore=*.class
set wildmode=list,longest
set cmdheight=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader and key maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=";"
let g:mapleader=";"
imap ;; <Esc>
map ;; <Esc>

map <leader>s :w<cr>
map <leader>p "+p
map <leader>a gT
map <leader>s gt


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Things to do on start
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
retab
color desert
