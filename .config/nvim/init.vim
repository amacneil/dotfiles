call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'

call plug#end()

" https://github.com/square/maximum-awesome/blob/master/vim/plugin/whitespace/whitespace.vim
function! StripWhitespace()
  let previous_search=@/
  let previous_cursor_line=line('.')
  let previous_cursor_column=col('.')
  %s/\s\+$//e
  let @/=previous_search
  call cursor(previous_cursor_line, previous_cursor_column)
endfunction

set encoding=utf-8
set ignorecase smartcase
set list
set listchars=tab:▸\ ,trail:▫
set number

:let mapleader = ","
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader><space> :call StripWhitespace()<CR>
nnoremap <leader>a :Ag<space>
nnoremap <silent> <C-l> :nohl<CR><C-l>
