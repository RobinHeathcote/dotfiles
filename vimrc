set nocompatible              " be iMproved, required
filetype off                  " required
"-----------------------------------------------
let g:mapleader = "\<space>"
nnoremap <silent><leader>q :quit<cr>
nnoremap <silent><leader>w :write<cr>
" toggle highlight search
nnoremap <silent><leader>h :set hlsearch!<cr>
" split panes
nnoremap <leader>\ :vsplit<cr>
nnoremap <leader>- :split<cr>
"-----------------------------------------------
"Vundle set up
"-----------------------------------------------

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
Plugin 'Townk/vim-autoclose'
Plugin 'Shougo/denite.nvim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
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
" ------------------------------------------------------
"  Denite
"  ----------------------------------------------------
nnoremap <silent><leader>uu               :Denite -buffer-name=file_rec
    \ file_rec<cr>
nnoremap <silent><leader>um               :Denite -buffer-name=models
    \ -path=`getcwd()`/app/models
    \ file_rec<cr>
nnoremap <silent><leader>uc               :Denite -buffer-name=controllers
  \ -path=`getcwd()`/app/controllers
  \ file_rec<cr>
nnoremap <silent><leader>uv               :Denite -buffer-name=views
  \ -path=`getcwd()`/app/views
  \ file_rec<cr>
nnoremap <silent><leader>uj               :Denite -buffer-name=javascripts
  \ -path=`getcwd()`/app/assets/javascripts
  \ file_rec<cr>
nnoremap <silent><leader>us               :Denite -buffer-name=specs
  \ -path=`getcwd()`/spec
  \ file_rec<cr>
nnoremap <silent><leader>ub               :Denite -buffer-name=buffers
  \ buffer<cr

"------------------------------------------------------------------
let g:airline_theme='one'
let g:airline_powerline_fonts=1
syntax on
set termguicolors
set background=dark " for the dark version
colorscheme one



"trim whitespace
autocmd BufWritePre *.* :%s/\s\+$//e

"Misc Setting

set number
set relativenumber
set hlsearch
set incsearch
set backspace=2
set tabstop=2 shiftwidth=2 shiftround expandtab
" Enable mouse if available
 if has("mouse")
   set mouse=a
 endif

set laststatus=2
set listchars=tab:>#,nbsp:_
" font
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h14

inoremap jj <esc>

inoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>

nnoremap <left> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>

