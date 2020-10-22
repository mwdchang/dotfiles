set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle related things
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" A better file explorer
Plugin 'scrooloose/nerdTree'

" Git plugin for Nerdtree ( meh .... kind of a mess )
" Plugin 'Xuyuanp/nerdtree-git-plugin'

" Golang stuff
Plugin 'fatih/vim-go'

" Match tag
Plugin 'valloric/MatchTagAlways'

" Solarized (Color scheme)
Plugin 'altercation/vim-colors-solarized'

" Candid (Color scheme)
Plugin 'flrnd/candid.vim'

" Vue syntax highlighting
Plugin 'posva/vim-vue'

" Editor config
Plugin 'editorconfig/editorconfig-vim'

" Status line
Plugin 'itchyny/lightline.vim'

" Surround
Plugin 'tpope/vim-surround'

" Runtime linter
Plugin 'w0rp/ale'

" Indent lines (show indent levels)
Plugin 'Yggdroot/indentLine'

" Marks sidebar (Seems to get int the way of ALE)
" Plugin 'Yilin-Yang/vim-markbar'


call vundle#end()
filetype plugin indent on



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
set nu
set nowrap
syn on
set visualbell
set t_vt=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and spaces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
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
map <leader>e :NERDTreeToggle<cr>

" change/yank/delete in tag
map <leader>cc cit<Esc>
map <leader>yy yit<Esc>
map <leader>dd dit<Esc>

" Marks
" Lowercase marks jump within file, uppercase marks jumps between files
" - m<a> mark at register a
" - `<a> jump to a
map <leader>m `

" vim-markbar
" nmap <Leader>m <Plug>ToggleMarkbar

" Format JSON via python
map <leader>j :%!python -m json.tool<cr>

" Turn on/off ALE
map <leader>l :ALEToggle<cr>

" Formatting
map <leader>f mzgg=G'z

" shift + asterisk, don't jump to next matching token
map * *``

" jump to place of last edit
map <leader>h '.



" expand shebang
inoremap #! #!/usr/bin/env bash


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convert tabs to spaces on save
" autocmd BufWritePre * %s/\s\+$//e

" Close window if NERDTree is the last panel
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Things to do on start
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Inconsolata:h13


" Enable light line plugin
set laststatus=2
let g:lightline = { 'colorscheme': 'seoul256' }


" IndentLine settings, disabled by default, use 'IndentLineToggle' to toggle
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#888888'
let g:indentLine_char_list = ['┊']
let g:indentLine_enabled = 0



set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    if !has('nvim')
        set ttymouse=xterm2
    endif
end

retab
color desert

" :setlocal spell spelllang=en_us
set spellfile=$HOME/.vim/en.utf-8.add


" Need to regenerate spell file
" mkspell! $HOME/.vim/en.utf-8.add



" For vue files
autocmd FileType vue syntax sync fromstart

" Disable syntax highlight for large buffers
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif


" Line stuff
" set cursorline
" set cursorcolumn


" Tweak search highlight
highlight Search guibg=darkgreen guifg=green gui=underline
