""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"BEGIN VUNDLE CONFIG 

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/taglist.vim.git'
Bundle 'juvenn/mustache.vim.git'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"END VUNDLE CONFIG 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"enable the mouse
set mouse=a

"does case-sensitive matching if the search string contains caps
set ignorecase
set smartcase

"set keybindings for tab movement
nmap <ESC>[5D :tabprevious<cr>
nmap <ESC>[5C :tabnext<cr>
map  <ESC>[5D :tabprevious<cr>
map  <ESC>[5C :tabnext<cr>
imap <ESC>[5D <ESC>:tabprevious<cr>i
imap <ESC>[5C <ESC>:tabnext<cr>i

"map Control-t to new tab
map <C-t> :tabnew 

"set the tab key to insert 4 spaces
set tabstop=4
set shiftwidth=4

"use spaces instead of tab characters for Python files
"autocmd BufNewFile,BufRead *.py set expandtab
set expandtab

"hilite tab characters
set lcs=tab:>-
"set list!

"map the space bar to toggle comments using NERD Commenter
map <Space> \c<Space>

"autocompletion highlight colors
highlight  Pmenu      cterm=NONE ctermfg=white ctermbg=blue 
highlight  PmenuSel   cterm=NONE ctermfg=black ctermbg=white
highlight  PmenuSbar  cterm=NONE ctermfg=white ctermbg=white
highlight  PmenuThumb cterm=NONE ctermfg=white ctermbg=cyan 

"always show the tab bar
set showtabline=2

"set C-x to quit the current tab
map <C-x> :q<cr>

"enable the matchit plugin to enable jumping between open and closing
"HTML tags (among other things)
runtime macros/matchit.vim

"show keys as they're pressed in normal mode
set showcmd

"make the cursor always stay at least 3 lines from the top or bottom of the
"screen
set scrolloff=3

"bold characters past the 79th column
highlight OverLength cterm=bold
autocmd BufNewFile,BufRead * match OverLength /\%>79v.\+/

"disable the arrow keys!
inoremap  <Up>     <Esc>:echo "use k"<cr>
inoremap  <Down>   <Esc>:echo "use j"<cr>
inoremap  <Left>   <Esc>:echo "use h"<cr>
inoremap  <Right>  <Esc>:echo "use l"<cr>
noremap   <Up>     :echo "use k"<cr>
noremap   <Down>   :echo "use j"<cr>
noremap   <Left>   :echo "use h"<cr>
noremap   <Right>  :echo "use l"<cr>

"turn off php variable highliting
autocmd BufNewFile,BufRead * highlight phpIdentifier cterm=NONE ctermfg=NONE

"source ~/dotfiles/google_python_style.vim

" modify buffers on switch
"set autowrite

" don't open buffers in new window when modified buffer exists
set hidden

" load NERDTree on vim start
autocmd vimenter * NERDTree

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" open and close NERDTree with <Tab>
map <Tab> :NERDTreeToggle<cr>

" close NERDTree when a file is opened
autocmd bufenter * if (!(exists("b:NERDTreeType") && b:NERDTreeType == "primary")) | NERDTreeClose | endif
