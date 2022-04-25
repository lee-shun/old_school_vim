"**************************************************************************************************
"
"       ___          ___          ___          ___                  ___                   ___
"      /\  \        /\__\        /\  \        /\  \                /\__\        ___      /\__\
"     /::\  \      /:/  /       /::\  \      /::\  \              /:/  /       /\  \    /::|  |
"    /:/\:\  \    /:/  /       /:/\:\  \    /:/\:\  \            /:/  /        \:\  \  /:|:|  |
"   /::\~\:\  \  /:/  /  ___  /::\~\:\  \  /::\~\:\  \          /:/__/  ___    /::\__\/:/|:|__|__
"  /:/\:\ \:\__\/:/__/  /\__\/:/\:\ \:\__\/:/\:\ \:\__\         |:|  | /\__\__/:/\/__/:/ |::::\__\
"  \/__\:\/:/  /\:\  \ /:/  /\/_|::\/:/  /\:\~\:\ \/__/         |:|  |/:/  /\/:/  /  \/__/~~/:/  /
"       \::/  /  \:\  /:/  /    |:|::/  /  \:\ \:\__\           |:|__/:/  /\::/__/         /:/  /
"        \/__/    \:\/:/  /     |:|\/__/    \:\ \/__/            \::::/__/  \:\__\        /:/  /
"                  \::/  /      |:|  |       \:\__\               ~~~~       \/__/       /:/  /
"                   \/__/        \|__|        \/__/                                      \/__/
"
"  Author : lee-shun
"
"  Email  : 2015097272@qq.com
"
"**************************************************************************************************


" ===
" === basic
" ===
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix,dos,mac

set nocompatible
let g:mapleader = ' '
set autochdir
set autoread
filetype plugin indent on

" for gvim and neovim gui, currently dotnvim
if has('gui_running') || exists('g:gui_dotnvim')
    set guifont=Hasklug\ NF:h12:cANSI
    set guifontwide=Hasklug\ NF:h12
    " set guifont=Hasklug\ Nerd\ Font:h12:cANSI
    " set guifontwide=Hasklug\ Nerd\ Font:h12
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set lines=30
    set columns=120
endif

" display
syntax on
set scrolloff=5
set number
set relativenumber
set cursorline
set cursorcolumn
" let &colorcolumn="81,".join(range(121,999),",")
let &colorcolumn="81,121"
set textwidth=80
set hidden
set showmode
set showcmd
set mouse=
set nowrap
set linebreak
set timeout           " for mappings
set timeoutlen=1000   " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value
set conceallevel=0
set wildmenu
set lazyredraw
set ttyfast

set t_Co=256
set termguicolors
if !has('nvim')
    " fix the termguicolors black and white in vi
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set laststatus=2
set cmdheight=1
set spelllang=en,cjk  " Spell languages
" Align indent to next multiple value of shiftwidth. For its meaning,
" see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround
" Virtual edit is useful for visual block edit
set virtualedit=block

" incremental substitution (neovim)
if has('nvim')
    set inccommand=split
endif

" keyword match
set showmatch               " 显示括号配对情况
set iskeyword+=_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割
set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]

" search
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
if version > 801
    set shortmess-=S
endif

set smartcase

" indent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab  " 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" folding
set foldmethod=manual
set foldlevel=99
set foldenable

" invisible symbol
set list
set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←
set showbreak=↪

" share clipboard
set clipboard^=unnamed,unnamedplus

" ===
" === built-in completion
" ===
set complete+=k
set completeopt=menuone,noselect,noinsert
set dictionary+=$CONF_PATH/20k

" ===
" === window split
" ===
set splitright
set splitbelow

" ===
" === change the cursor shape(works on alacritty,but change the fonts in git bash)
" ===
if !has('nvim')
    " Change cursor shapes based on whether we are in insert mode,
    " see https://vi.stackexchange.com/questions/9131/i-cant-switch-to-cursor-in-insert-mode
    let &t_SI = "\<esc>[6 q"
    let &t_EI = "\<esc>[2 q"
    if exists('&t_SR')
        let &t_SR = "\<esc>[4 q"
    endif
endif

" ===
" === modify history
" ===
if empty(glob($CONF_PATH."/tmp/"))
    echo "Creating the tmp dir!"
    silent exec "!mkdir -p " . $CONF_PATH . "/tmp/backup"
    silent exec "!mkdir -p " . $CONF_PATH . "/tmp/undo"
endif

set undofile
set swapfile
set nobackup
set undodir=$CONF_PATH/tmp/undo
set backupdir=$CONF_PATH/tmp/backup
set directory=$CONF_PATH/tmp/backup

" ===
" === ignore some file types
" ===
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf

" ===
" === build-in netrw
" ===
let g:netrw_hide = 1
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_winsize = 25
let g:netrw_chgwin = 2
let g:netrw_list_hide = '.*\.swp$'
let g:netrw_localrmdir = 'rm -rf'

noremap <LEADER>t :Lexplore<CR>

function! NetrwMapping()
    nmap <buffer> H u
    nmap <buffer> <BS> -
    nmap <buffer> l <CR>
endfunction
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

" ===
" === Terminal Behaviors
" ===
tnoremap <C-N> <C-\><C-N>
let g:neoterm_autoscroll = 1
if exists('##TermOpen')
    augroup term_settings
        autocmd!
        autocmd TermOpen * setlocal norelativenumber nonumber
        autocmd TermOpen * startinsert
    augroup END
endif
