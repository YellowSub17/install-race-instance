"___________________
"___________________
"      PLUGINS
"___________________
"___________________


"if plug is not installed, install it.

if empty(glob('~/.vim/autoload/plug.vim'))

    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

    " better status line
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'

    " syntax checking on save
    Plug 'vim-syntastic/syntastic'

    " auto completing
    Plug 'ycm-core/YouCompleteMe'

    " color scheme
    Plug 'vim-python/python-syntax'

    " commenting
    Plug 'preservim/nerdcommenter'

    ""Highlight yanked text
    Plug 'machakann/vim-highlightedyank'

    "file tree
    Plug 'preservim/nerdtree'


"Duane's Addons    
    "sensible shortcuts
    Plug 'tpope/vim-sensible'
    
    "Autopair brackets
    Plug 'jiangmiao/auto-pairs'
        
    "python indenting
    Plug 'vim-scripts/indentpython.vim'


call plug#end()




"___________________
"___________________
"  LIGHTLINE SETTINGS
"___________________
"___________________



"lightlight settings
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],  ],
      \   'right': [ ['lineinfo'] ]
      \ },
      \ 'inactive': {
      \   'left': [],
      \   'right': []
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [],
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

"show buffnumbers
let g:lightline#bufferline#show_number = 1

" clickable bufferline
let g:lightline#bufferline#clickable = 1
let g:lightline.component_raw = {'buffers': 1}

" turn off --INSERT-- line, shown in lightline
"set noshowmode
"___________________
"___________________
"  YCM SETTINGS
"___________________
"___________________


let g:ycm_autoclose_preview_window_after_insertion = 1

"___________________
"___________________
"  SYNTAX SETTINGS
"___________________
"___________________


" use flake 8 for syntax
let g:syntastic_python_checkers=['flake8']

""ignore pep8 flags
let g:syntastic_python_flake8_args='--ignore=F541,E128,E305,E501,E741,E203,W503,E302,E228,E303,E124,E127,E251,E226,W291,E231,E201,E202,E265,E222,E225,E115,E116,E117,E241,E261,E262,W391,E402,F401,E301,E266,F841,E114,E126,E123'


"___________________
"___________________
"  NERDTree SETTINGS
"___________________
"___________________


let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0


"___________________
"___________________
" BASE VIM SETTINGS
"___________________
"___________________



"change buffers without saving
set hidden

"start scrolling after 8 lines
set scrolloff=8

" always show the status bar
set laststatus=2


" turn on line numbering
set number
set relativenumber
set ruler

" Command bar height
set cmdheight=1
set showcmd

" Display a confirmation dialog when closing unsaved files
set confirm

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" guess indentation levels
set smartindent

" Searching, detect case sensitivity and search while typing
set smartcase
set incsearch

" backups and swap directories
silent !mkdir ~/.vim > /dev/null 2>&1
silent !mkdir ~/.vim/backup > /dev/null 2>&1
silent !mkdir ~/.vim/swap > /dev/null 2>&1
silent !mkdir ~/.vim/undo > /dev/null 2>&1
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" sane editing
set colorcolumn=80
set expandtab
set autoindent

"set viminfo='25,\"50,n~/.viminfo

" tab lengths
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})


" mouse
set mouse=a
"noremap <silent> <Leader>m :call ToggleMouse()<CR>

filetype on
filetype plugin indent on


" code folding
set foldmethod=indent
set foldlevel=99

" No sounds when hitting end of line
set noerrorbells

" wrap toggle
setlocal nowrap
"noremap <silent> <Leader>w :call ToggleWrap()<CR>

" specify screen splits
set splitbelow
set splitright

set showtabline=2  " always show tabline

" Show matching brackets when text indicator is over them
set showmatch 


" Don't redraw while executing macros (good performance config)
set lazyredraw 

"timeout of key sequence
set notimeout


"project specific vimrc
set exrc
set secure

" Delete inserted text after leaving insert
set backspace=indent,eol,start

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"


"html tag
set matchpairs+=<:>



"___________________
"___________________
"       REMAPS
"___________________
"___________________
"

"button to enter my command mode
let mapleader = ","

"This unsets the /last_search_pattern register by hitting return
nnoremap <CR> :noh<CR><CR>


" toggle nerd tree
nnoremap <C-t> :NERDTreeToggle<CR>

" refresh nerd tree
nmap <C-r> :NERDTreeRefreshRoot<CR>

" shortcut for goto
map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" write quit when in caps
ca WQ wq

" horizontal split
ca hsp sp

" copy, cut and paste
set clipboard=unnamedplus
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y




"move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bp<bar>bd#<CR>

" word movement
imap <S-Left> <Esc>bi
nmap <S-Left> b
imap <S-Right> <Esc><Right>wi
nmap <S-Right> w

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv






"___________________
"___________________
"   PYTHON SYNTAX
"___________________
"___________________

" see
" https://github.com/vim-python/python-syntax/blob/master/syntax/python.vim
" for syntax groups
"
let python_highlight_all=1
let python_highlight_operators=0


" enable 256 colors
set t_Co=256
set termguicolors




""line numbers
highlight LineNr guifg=#999999
highlight ColorColumn guibg=#333333

"" normal text
highlight Normal guifg=#ffffff guibg=#1d1d1d


""green
highlight pythonString guifg=#19aa1c guibg=#1d1d1d
highlight pythonFString guifg=#19aa1c guibg=#1d1d1d

""red
highlight pythonComment guifg=#8c403f guibg=#1d1d1d

""yellow
highlight pythonNumber guifg=#efc402 guibg=#1d1d1d
highlight pythonFloat guifg=#efc402 guibg=#1d1d1d

"Orange
highlight pythonBoolean guifg=#c17228 guibg=#1d1d1d
highlight pythonNone guifg=#c17228 guibg=#1d1d1d
highlight pythonOperator guifg=#c17228 guibg=#1d1d1d
highlight pythonImport guifg=#c17228 guibg=#1d1d1d
highlight pythonStatement guifg=#c17228 guibg=#1d1d1d
highlight pythonRepeat guifg=#c17228 guibg=#1d1d1d
highlight pythonConditional guifg=#c17228 guibg=#1d1d1d
highlight pythonException guifg=#c17228 guibg=#1d1d1d

"Blue
highlight pythonFunction guifg=#2b83db guibg=#1d1d1d 
highlight pythonClass guifg=#2b83db guibg=#1d1d1d 
highlight pythonFunctionCall guifg=#2b83db guibg=#1d1d1d 

"purple
highlight pythonError guifg=#9328c1  guibg=#1d1d1d 
highlight pythonBuiltinType guifg=#9328c1 guibg=#1d1d1d 
highlight pythonBuiltinFunc guifg=#9328c1 guibg=#1d1d1d 
highlight pythonBuiltin guifg=#9328c1 guibg=#1d1d1d 
highlight pythonBuiltinObj guifg=#9328c1 guibg=#1d1d1d 
highlight pythonClassVar guifg=#9328c1 guibg=#1d1d1d 




syntax enable
"color one





