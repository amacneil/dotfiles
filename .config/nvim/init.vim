call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'

call plug#end()

:let mapleader = ","
map <C-n> :NERDTreeToggle<CR>
