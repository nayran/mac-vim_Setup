execute pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

nmap <f1> :FortyTwoHeader<CR>
nmap <f2> :NERDTreeToggle<CR>

""open a NERDTree automatically when vim starts up if no files were specified""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

colorscheme gruvbox
syntax on
set bg=dark

set visualbell
set scrolloff=12
set history=1000
set tabstop=4
set colorcolumn=80
set shiftwidth=4
set softtabstop=4
set hls
set showcmd
set lbr
set smartindent
set autoindent
set showmatch
set wildmenu
set showcmd
set number
set ruler
set hidden
