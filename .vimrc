syntax on
filetype plugin indent on
set number
set ruler
set showcmd
set ignorecase
set smartcase
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set termguicolors
set nocompatible
set hlsearch

call plug#begin('~/.vim/plugged')
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

colorscheme catppuccin_macchiato

