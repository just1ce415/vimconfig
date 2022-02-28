" p, y, d commands works with system clipboard.
set clipboard=unnamedplus

inoremap jh <Esc>

" Additional
set noeb

" Formatting
filetype plugin indent on

set nu
set nowrap
set smartcase

set noswapfile
set nobackup
set path=.,**

set nohlsearch
set incsearch

set exrc
set hidden
set scrolloff=8
set signcolumn=yes

" Environment variables
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vim/vimrc"

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ALE plugin - linting
Plug 'dense-analysis/ale'

" Autocomplete
Plug 'https://github.com/ycm-core/YouCompleteMe.git'

call plug#end()

colo delek
set background=dark

let mapleader = " "
let g:ale_fixers = {'python': ['black']}
let g:ale_linters = {'python': ['pylint']}
let g:ale_fix_on_save = 1

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>gtd :YcmCompleter GoTo<CR>
" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_GROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
