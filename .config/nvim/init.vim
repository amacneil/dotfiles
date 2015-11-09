call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go'
Plug 'bling/vim-airline'

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

set clipboard=unnamed " use system clipboard
set encoding=utf-8
set ignorecase smartcase
set list
set listchars=tab:▸\ ,trail:▫
set nohlsearch " don't highlight all search matches
set number " line numbers
set tabstop=8 softtabstop=2 shiftwidth=2 expandtab

autocmd Filetype go setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

:let mapleader = ","
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader><space> :call StripWhitespace()<CR>
nnoremap <leader>a :Ag<space>
nnoremap <silent> <C-l> :nohl<CR><C-l>

" The Silver Searcher
" https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
