" Chaz Bailey's vimrc

" General Key Mappings {{{
let mapleader = ","

" jj to leave insert mode
inoremap jj <Esc>

" CTRL-Backspace to delete the previous word
inoremap <C-BS> <C-W>
" CTRL-Delete to delete the next word
inoremap <C-Del> <Esc>dwi

" Space open/closes folds
nnoremap <space> za

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Command 'Vimrc' to open vimrc
command Vimrc execute "e $MYVIMRC"

" }}}
" Plugin Management {{{
" Get pathogen up and running
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" NERDTree Config {{{
" Set nerd tree to ,n
nnoremap <leader>n :NERDTreeToggle<CR>
" }}}
" CtrlP Config {{{
" Set CtrlP to ,p
nnoremap <leader>p :CtrlPMixed<CR>
" }}}
" }}}
" Backup {{{
" Turn off the creation of those backup files... just SAVE
set nobackup
" }}}
" Windows Specific {{{
if !has("unix")
    source $VIMRUNTIME\mswin.vim
    " Set the default directory to the C:\
    cd C:\
endif
" }}}
" Colours {{{
" Set a colourscheme
colorscheme desert

" Enable syntax processing
syntax enable

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
set t_Co=16
endif

" }}}
" UI Config {{{
" Load filetype specific indent files and plugins
filetype plugin indent on

" Show line numbers
set number

" Show ruler
set ruler

" Show last command in bottom bar
set showcmd

" Visual autocomplete for command menu
set wildmenu

" Redraw only when we need to (not in the middle of macros)
set lazyredraw

" Highlight matching [{()}]
set showmatch

" }}}
" Spaces & Tabs {{{
" Tabs are spaces
set expandtab

" Number of visual spaces per TAB (reading)
set tabstop=4

" Number of spaces in tab when editing
set softtabstop=4

" Controls how many columns text is indented
set shiftwidth=4

" Smart indenting
set smartindent

" Auto indenting
set autoindent

" Matchit Macro for XML and HTML (Extends the power of %)
runtime! macros/matchit.vim

" }}}
" Searching {{{
" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Ignore case
set ignorecase
" }}}
" Folding {{{
" Enable folding
set foldenable

" Open most folds by default (up to 10 layers)
set foldlevelstart=10

" 10 nested folds max
set foldnestmax=10

" Set folds based on syntax
set foldmethod=syntax
" }}}
" Keeping vimrc organised {{{
set foldmethod=marker
set foldlevelstart=0
set modelines=1
" vim:foldmethod=marker:foldlevel=0
" }}}

