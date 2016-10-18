call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'tomlion/vim-solidity'
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'

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

set clipboard=unnamedplus " use system clipboard
set encoding=utf-8
set ignorecase smartcase
set list
set listchars=tab:▸\ ,trail:▫
set nohlsearch " don't highlight all search matches
set number " line numbers
set ruler " column numbers
set tabstop=8 softtabstop=2 shiftwidth=2 expandtab

autocmd Filetype go setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd Filetype make setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd Filetype dockerfile setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd Filetype cmake setlocal commentstring=#\ %s

let mapleader = ','
let NERDTreeIgnore = ['\.pyc$', '__pycache__$']

map <C-n> :NERDTreeToggle<CR>
noremap <leader><space> :call StripWhitespace()<CR>
noremap <leader>a :Ag<space>
noremap <leader>gi :w<CR>:GoInstall<CR>
noremap <leader>s :sort i<CR>
noremap <silent> <C-l> :nohl<CR><C-l>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_javascript_checkers = ['eslint']

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
