if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.vim/plugged')

    Plug 'scrooloose/nerdtree'
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
    Plug 'rust-lang/rust.vim'

    call plug#end()
endif

let mapleader = ','
set encoding=utf-8
set directory=~/.vim/swap//
set ignorecase smartcase
set list
set listchars=tab:▸\ ,trail:▫
set nohlsearch " don't highlight all search matches
set number " line numbers
set ruler " column numbers
set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
set autoindent

autocmd Filetype go setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd Filetype make setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd Filetype dockerfile setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd Filetype javascript setlocal tabstop=8 softtabstop=2 shiftwidth=2
autocmd Filetype cmake setlocal commentstring=#\ %s
autocmd Filetype cpp setlocal commentstring=//\ %s
autocmd Filetype tf setlocal commentstring=#\ %s

" https://github.com/square/maximum-awesome/blob/master/vim/plugin/whitespace/whitespace.vim
function! StripWhitespace()
    let previous_search=@/
    let previous_cursor_line=line('.')
    let previous_cursor_column=col('.')
    %s/\s\+$//e
    let @/=previous_search
    call cursor(previous_cursor_line, previous_cursor_column)
endfunction

" use system clipboard
if system('uname -s') == "Darwin\n"
    set clipboard=unnamed " macOS
else
    set clipboard=unnamedplus " linux
endif

" The Silver Searcher
" https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
    " ag.vim
    let g:ag_prg = 'ag --column --nogroup --noheading --nobreak'

    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__$']
map <C-n> :NERDTreeToggle<CR>
noremap <leader><space> :call StripWhitespace()<CR>
noremap <leader>a :Ag<space>
noremap <leader>gb :w<CR>:GoBuild<CR>
noremap <leader>gi :w<CR>:GoInstall<CR>
noremap <leader>s :sort i<CR>
noremap <silent> <C-l> :nohl<CR><C-l>

" vim-go
let g:go_fmt_command = "goimports"

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
let g:syntastic_shell_checkers = ['shellcheck']
