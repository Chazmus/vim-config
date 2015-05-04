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

" Move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap ; :

" Move around windows quickly
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

" }}}
" User created commands{{{
command Vimrc execute "e $MYVIMRC"
" }}}
" Leader tags{{{

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Sweet ass buffer mapping. ,b to list and prepare for a buffer change
nnoremap <leader>b :buffers<CR>:buffer<Space>

" NERD Tree
nnoremap <leader>nn :NERDTreeToggle<CR>
" NERD Tree find
nnoremap <leader>nf :NERDTreeFind<CR>

" Set CtrlP to ,p
nnoremap <leader>p :CtrlPMixed<CR>
" }}}
" Plugin Management {{{
" Get pathogen up and running
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" NERDTree Config {{{
" Show hidden files and folders by default
let NERDTreeShowHidden=1
" }}}
" CtrlP Config {{{
" }}}
" vim-javascript Config{{{
" Enable javascript syntax highlighting
let g:javascript_enable_domhtmlcss = 1
" }}}
" ShowMarks Config {{{
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
" }}}
" Easy-Grep Config {{{
let g:EasyGrepFileAssociations='C:/Users/sp_admin/Desktop/Vim/vimfiles/bundle/EasyGrep/plugin/EasyGrepFileAssociations'
let g:EasyGrepMode=0
let g:EasyGrepCommand=1
let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir=1
let g:EasyGrepIgnoreCase=1
let g:EasyGrepHidden=1
let g:EasyGrepFilesToExclude=''
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepWindow=0
let g:EasyGrepReplaceWindowMode=0
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=1
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepFileAssociationsInExplorer=0
let g:EasyGrepExtraWarnings=1
let g:EasyGrepOptionPrefix='<leader>vy'
let g:EasyGrepReplaceAllPerFile=0
" }}}
" Syntastic Config {{{
" Set jshint as the javascript checker
let g:syntastic_javascript_checkers = ['jshint']
" }}}
" Taglist Config {{{
if has("win32")
    let Tlist_Ctags_Cmd="C:/Users/Chaz/Vim/.vim/ctags.exe"
endif
" }}}
" Snipmate Config {{{
" Allow AutoComplPop to use snipmate
let g:acp_behaviorSnipmateLength = 1

" }}}
" }}}
" Backup {{{
" Turn off the creation of those backup files... just SAVE
set nobackup
" }}}
" Windows Specific {{{
if !has("unix")
    " Uncomment the line below to get all your favourite windows bindings
    source $VIMRUNTIME\mswin.vim

    " Set the default directory to the C:\
    cd C:/Users/Chaz/workspace
endif
" }}}
" Colours {{{
" Set a colourscheme
colorscheme darkblue

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

" Sets auto folding on xml
let g:xml_syntax_folding=1
" }}}
" Keeping vimrc organised {{{
" Turns on modeline searching. Such as for the line below it setting up the
" fold method
set modeline
" vim: foldmethod=marker:foldlevelstart=0:foldlevel=0
" }}}
