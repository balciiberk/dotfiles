call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'                             " VimWiki
"Plug 'dense-analysis/ale'


call plug#end()


set nocompatible
filetype plugin on
syntax on

filetype indent on
filetype plugin indent on
set si
set shiftwidth=2

set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.


"vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['clang-format', 'clangtidy']
\}
