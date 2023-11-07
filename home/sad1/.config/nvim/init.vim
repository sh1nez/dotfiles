set mouse=a
set number
syntax enable


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

inoremap <C-j> <esc>

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'


call plug#end()

