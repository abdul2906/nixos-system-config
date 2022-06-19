" Author: abdul2906
" Last modified: 12.6.2022

" Plugins    
call plug#begin('~/.vim/plugged')    
Plug 'nvim-telescope/telescope.nvim'    
Plug 'LnL7/vim-nix'
Plug 'gruvbox-community/gruvbox'    
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Enable syntax highliting
syntax on

" Indent configuration
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Visual
set number
set guicursor=
set nohlsearch
set termguicolors
set incsearch
set nowrap
set scrolloff=8
set completeopt=menuone,noselect,noinsert
colorscheme gruvbox
highlight Normal guibg=none

" Enable project specific rc
set exrc

" Disable antichrist errorbells
set noerrorbells

" Swap and undo history
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set hidden

" Set the mapleader
let mapleader = " "

