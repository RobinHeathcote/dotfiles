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
nnoremap <leader>e :Explore<cr>
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
Plugin 'rizzatti/dash.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ervandew/supertab'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'prettier/vim-prettier'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'alvan/vim-closetag'
Plugin 'elmcast/elm-vim'
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
" -----------------------------------------------------
"  Nerdtree
"  ----------------------------------------------------
  map <Leader>n :NERDTreeToggle<CR>
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
  \ buffer<cr>

"------------------------------------------------------------------
let g:airline_theme='one'
let g:airline_powerline_fonts=1
syntax on
set termguicolors
set background=dark " for the dark version
colorscheme one

"Vim-prettier
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0

" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

" max line length that prettier will wrap on
let g:prettier#config#print_width = 80
" number of spaces per indentation level
let g:prettier#config#tab_width = 4
" single quotes over double quotes
let g:prettier#config#single_quote = 'true'
" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'
" none|es5|all
let g:prettier#config#trailing_comma = 'none'
" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'flow'

"--------------------------------------------------------
"grep
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
"--------------------------------------------------------
"ale
scriptencoding utf-32

let g:ale_linters = {
      \   'Dockerfile': ['hadolint'],
      \   'haml': ['haml_lint'],
      \   'javascript': ['eslint', 'flow'],
      \   'jsx': ['eslint', 'flow'],
      \   'ruby': ['rubocop'],
      \   'vim': ['vint'],
      \   'yaml': ['yamllint'],
      \ }

let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \ }

nnoremap <silent><C-n> :ALENext<cr>
nnoremap <silent><C-p> :ALEPrevious<cr>
nnoremap <silent><localleader>f   :ALEFix<cr>

let g:ale_sign_column_always = 1
let g:ale_sign_error = '••'
let g:ale_sign_warning = '••'

highlight link ALEErrorSign DiffDelete
highlight link ALEError DiffDelete

highlight link ALEWarningSign Todo
highlight link ALEWarning Todo

let g:ale_echo_msg_format = '%linter%: %s'
"---------------------------------------
"close-tag"
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

"-------------------------------------------------------
"emmet-vim
let g:user_emmet_leader_key='<c-e>'

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

"-----------------------------------------------------"
"trim whitespace
autocmd BufWritePre *.* :%s/\s\+$//e

"Misc Setting

set number
set relativenumber
set nowrap
set winwidth=84
set hlsearch
set incsearch
set backspace=2
set tabstop=2 shiftwidth=2 shiftround expandtab
set nobackup                 " disable backups
set nowritebackup            " disable backups
set noswapfile              " disable swapfiles
set directory=~/.vim/swap    " location of swapfiles
" Enable mouse if available
 if has("mouse")
   set mouse=a
 endif

set laststatus=2
set listchars=tab:>#,nbsp:_
" font
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h14

" Highlight column when over 80 characters
highlight CharacterLimit ctermbg=magenta
call matchadd('CharacterLimit', '\%81v', 100)
call matchadd('Error', '\%121v', 100)

inoremap jj <esc>

" Easier window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Allow JSX in normal JS files
let g:jsx_ext_required = 0
let g:vim_jsx_pretty_colorful_config = 1

