""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"BEGIN VUNDLE CONFIG 

filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
"Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/taglist.vim.git'
Plugin 'juvenn/mustache.vim.git'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'MaxMEllon/vim-jsx-pretty'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'tpope/vim-rails.git'
" vim-scripts repos
"Plugin 'L9'
"Plugin 'FuzzyFinder'
" non github repos
"Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()
filetype plugin indent on     " required! 

"END VUNDLE CONFIG 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on

"enable the mouse
set mouse=a

"does case-sensitive matching if the search string contains caps
set ignorecase
set smartcase

"set keybindings for tab movement
nmap <c-p> :tabprevious<cr>
nmap <c-n> :tabnext<cr>
map  <c-p> :tabprevious<cr>
map  <c-n> :tabnext<cr>
imap <c-p> <ESC>:tabprevious<cr>i
imap <c-n> <ESC>:tabnext<cr>i

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
"inoremap  <Up>     <Esc>:echo "use k"<cr>
"inoremap  <Down>   <Esc>:echo "use j"<cr>
"inoremap  <Left>   <Esc>:echo "use h"<cr>
"inoremap  <Right>  <Esc>:echo "use l"<cr>
"noremap   <Up>     :echo "use k"<cr>
"noremap   <Down>   :echo "use j"<cr>
"noremap   <Left>   :echo "use h"<cr>
"noremap   <Right>  :echo "use l"<cr>

"turn off php variable highliting
autocmd BufNewFile,BufRead * highlight phpIdentifier cterm=NONE ctermfg=NONE

" always used the htmldjango syntax handling for .html files
autocmd BufNewFile,BufRead *.html set ft=htmldjango

"source ~/dotfiles/google_python_style.vim

" modify buffers on switch
"set autowrite

"" don't open buffers in new window when modified buffer exists
"set hidden

"" load NERDTree on vim start
autocmd vimenter * NERDTree
autocmd vimenter * NERDTreeClose

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" open and close NERDTree with <Tab>
"map <Tab> :NERDTreeToggle<cr>
map <Tab> :NERDTreeTabsToggle<cr>

" close NERDTree when a file is opened
"autocmd bufenter * if (!(exists("b:NERDTreeType") && b:NERDTreeType == "primary")) | NERDTreeClose | endif

" open NERDTree on the right
let g:NERDTreeWinPos = "right"

" hide *.pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

" color scheme for vimdiff
highlight DiffAdd cterm=NONE ctermfg=NONE ctermbg=green
highlight DiffDelete cterm=NONE ctermfg=NONE ctermbg=red
highlight DiffChange cterm=NONE ctermfg=NONE ctermbg=yellow
highlight DiffText cterm=NONE ctermfg=NONE ctermbg=magenta


"function b:JavaScriptSyntaxAdditions()
    "" set up some more keywords
    "syn keyword javaScriptGlobal		self window top parent
    "syn keyword javaScriptIdentifier	arguments

    "" changing some of the colors for pangloss/vim-javascript
    "highlight javaScriptLabel cterm=NONE ctermfg=green ctermbg=NONE
    "highlight javaScriptType cterm=NONE ctermfg=darkcyan ctermbg=NONE
    "highlight link javaScriptThis javaScriptFunction
    "highlight link javaScriptGlobal Operator
    "highlight link javaScriptIdentifier Operator
"endfunction

"autocmd bufenter *.js call b:JavaScriptSyntaxAdditions()

" Syntastic config options
let g:syntastic_python_checkers = ['pylint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Displays Highlight Color Group for character under cursor
" Press \sp to run
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" make colors brighter
set t_Co=256
hi Normal ctermfg=white
hi Comment ctermfg=blue
hi Constant ctermfg=red
hi Identifier ctermfg=cyan
hi Statement ctermfg=yellow
hi PreProc ctermfg=magenta
hi Type ctermfg=green
hi Special ctermfg=magenta
hi Underlined ctermfg=magenta

