:filetype plugin on "enable syntax highlight
:syntax on

set mouse=a "enable mouse

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir "persistant undo

"set spell "spell checking

""""""""""
"A Good Vimrc
"""""""""
set tabstop=4 "visual spaces per tab
set softtabstop=4 "number of spaces in a tab when editing(?)

set shiftwidth=4
set autoindent
set smartindent

set expandtab "tabs are spaces

set clipboard=unnamedplus "Use clipboard for copy/paste
""""""""
" UI Config
""""""""

:set number relativenumber "turn hybrid line numbers on
:set nu rnu

"set number "show line numbers
set showcmd "show command line in bottom bar
"set cursorline "highlight current line

filetype indent on "load filetype-specific indent files

set wildmenu "visual auto complete for command menu

set lazyredraw "redraw only when need to

set showmatch "highlight matching [({})]

set colorcolumn=80 "highlight column 80

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/ "highlight whitespace

"""""""
" Searching
" """""
set incsearch "search as characters are entered
set hlsearch "highlight search results

"""""""
" Leader Shortcuts
""""""

let mapleader=","

""""""""
" Plugins
"""""""
"Initialize Plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'lambdalisue/vim-fullscreen'

Plug 'tomlion/vim-solidity'

Plug 'rust-lang/rust.vim'

Plug 'glts/vim-magnum' " gA to see number representation
Plug 'glts/vim-radical' " crd, crx, cro, crb to decimal, hex, octal, binary

" end plugin system
call plug#end()

"""""""
"Plugins config
"""""""

" NerdTree starts when opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"Control+n toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

"AutoClose when Nerdtree is the only tab left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
