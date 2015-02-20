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
nnoremap <leader>nf :NERDTreeFind<CR>
" }}}
" CtrlP Config {{{
" Set CtrlP to ,p
nnoremap <leader>p :CtrlPMixed<CR>
" }}}
" vim-javascript Config{{{
" Enable javascript syntax highlighting
let g:javascript_enable_domhtmlcss = 1
" }}}
" Omni-sharp Config{{{
" Enable c# autocompletion
set omnifunc=syntaxcomplete#Complete

" Set Ctrl-Space in insert mode to use omnisharp autocomplete
inoremap <c-Space> <c-x><c-o>


" Recommended by the Omnisharp github page:
augroup omnisharp_commands
    autocmd!
    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue 
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>  
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
    " Contextual code actions (requires CtrlP)
    autocmd FileType cs nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

    " rename with dialog
    autocmd FileType cs nnoremap <leader>nm :OmniSharpRename<cr>
    autocmd FileType cs nnoremap <F2> :OmniSharpRename<cr>      

    " Force OmniSharp to reload the solution. Useful when switching branches etc.

    autocmd FileType cs nnoremap <leader>rl :OmniSharpReloadSolution<cr>
    autocmd FileType cs nnoremap <leader>cf :OmniSharpCodeFormat<cr>
    " Load the current .cs file to the nearest project
    autocmd FileType cs nnoremap <leader>tp :OmniSharpAddToProject<cr>

    " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
    autocmd FileType cs nnoremap <leader>ss :OmniSharpStartServer<cr>
    autocmd FileType cs nnoremap <leader>sp :OmniSharpStopServer<cr>

    " Add syntax highlighting for types and interfaces
    autocmd FileType cs nnoremap <leader>th :OmniSharpHighlightTypes<cr>
    "Don't ask to save when changing buffers (i.e. when jumping to a type definition)
    autocmd FileType cs set hidden
augroup END

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500


" }}}
" Mini Buffer Explorer Config {{{
" Set open Mini Buffer Explorer
nnoremap <leader>b :MBEToggle<CR>
nnoremap <leader>bf :MBEFocus<CR>
nnoremap <leader>bn :MBEbn<CR>
nnoremap <leader>bp :MBEbp<CR>
" }}}

" }}}
" Backup {{{
" Turn off the creation of those backup files... just SAVE
set nobackup
" }}}
" Windows Specific {{{
if !has("unix")
    " Uncomment the line below to get all your favourite windows bindings
    " back!
    " source $VIMRUNTIME\mswin.vim
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

