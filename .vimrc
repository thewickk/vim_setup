set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" PHP Syntax Highlighting Plugin
Plugin 'php.vim'

"Plugin for evenly alligning text
Plugin 'Tabular'

""Adding NERDTree for filesystem exploration ease
Plugin 'scrooloose/nerdtree'





" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let myvar="MY VIMRC LOADED"

"set indentation preferences
set tabstop=2
set shiftwidth=2
set expandtab

"training wheels
nnoremap <Up> :echomsg "use k"<cr>
nnoremap <Down> :echomsg "use j"<cr>
nnoremap <Left> :echomsg "use h"<cr>
nnoremap <Right> :echomsg "use l"<cr>

"show line numbers
set number

"allow files to be created in the directory of the current open file
set autochdir

"open NERDTree automatically when entering Vim
autocmd vimenter * NERDTree

"colorscheme of choice for the time being
colorscheme koehler

"Highlight curser and add a visual line to show which window/buffer you are
"working in
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

"Allow NERDTree to show hidden directories and files in the directory tree
let NERDTreeShowHidden=1

"Highligh text that is over the 80 character limit that I prefer
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"limit the NERDTree window to 20 characters to maximize editing space
let g:NERDTreeWinSize = 20
syntax on
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a
" modifiable
" file, and we're not in vimdiff
function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
      NERDTreeFind
      wincmd p
    endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
