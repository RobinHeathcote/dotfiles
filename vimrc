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
" plugin on GitHub repo
Plugin 'rakr/vim-one'
Plugin 'tpope/vim-rails'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'jiangmiao/auto-pairs'
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
let g:airline_theme='one'
let g:airline_powerline_fonts=1
syntax on
inoremap jj <esc>
set termguicolors
set background=dark " for the dark version
colorscheme one



"trim whitespace
autocmd BufWritePre *.* :%s/\s\+$//e

"Misc Setting

set number
set relativenumber
set hls
set incsearch

" Enable mouse if available
 if has("mouse")
   set mouse=a
 endif

set laststatus=2
set listchars=tab:>#,nbsp:_
