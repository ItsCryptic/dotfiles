" PLUGINS ---------------------------------------------------------------- {{{
"
 call plug#begin('~/.vim/plugged')
"
    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
"
"
call plug#end()
"
" }}}

" Disable compatability with vi which can cause issues.
set nocompatible
" Filetype detection
filetype on
" Enable plugins and load plugin for the detected filetype
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
" Syntax highlighting
syntax on
" Add line numbers
set number


" Set shift width to 4 spaces.
set shiftwidth=4
" Set tab width to 4 columns.
set tabstop=4
" Use space characters instead of tabs
set expandtab
" Don't save backup files
set nobackup
" Don't wrap lines
set nowrap
" Search through a file incrementally highlight matching charcters as you type
set incsearch

set smartcase
" Show partial command you typed in the last line of the screen
set showcmd
" Show the mode you are on the last line
set showmode
" Show matching word during search
set showmatch
" Highlight during search
set hlsearch
" Commands to save in history
set history=1000
" Enable auto completion menu after pressing tab.
set wildmenu
" Make wildmenu behave like Bash completion
set wildmode=list:longest
" Ignore certain files
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
