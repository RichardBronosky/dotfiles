" BEGIN VUNDLE SETUP
set nocompatible              " be iMproved, required
filetype off                  " required

" NOTE: If you get errors like this...
"     Unknown function: vundle#begin
" Run these commands to get vundle set up.
"     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"     vim +PluginInstall +qall

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' " https://github.com/gmarik/Vundle.vim

Plugin 'bling/vim-airline' " https://github.com/bling/vim-airline
Plugin 'tpope/vim-fugitive' " https://github.com/tpope/vim-fugitive
Plugin 'nvie/vim-flake8' " https://github.com/nvie/vim-flake8 requires: sudo pip install flake8

Plugin 'sudar/vim-arduino-syntax' " https://github.com/sudar/vim-arduino-syntax
Plugin 'jamessan/vim-gnupg' " https://github.com/jamessan/vim-gnupg

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" END VUNDLE SETUP

" file handling
autocmd BufWritePost *.py call Flake8()
autocmd BufRead,BufNewFile   *.py setlocal et

" backups and swap directory
autocmd BufWritePre  *    let &bex = '-' . strftime("%Y-%m-%d@%X") . '~'
set directory=~/.vim/swp//
set backupdir=~/.vim/backup//
set backup

syntax on
set scrolloff=4
set laststatus=2 
set hidden
set ts=4 sw=4 sts=4
set hls ic
