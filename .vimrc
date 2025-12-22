" from https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/ 

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
set smartcase

" Sets code folding to indent.
set foldmethod=indent

" Allows NERDTree to edit hidden files.
let NERDTreeShowHidden=1

" PLUGINS ------------------------------------------------------------------------

" Plugin code goes here.

" }}}

" MAPPINGS -----------------------------------------------------------------------

"

" VIMSCRIPT ----------------------------------------------------------------------

"

" STATUS LINE --------------------------------------------------------------------

" Status bar code goes here. 

"
