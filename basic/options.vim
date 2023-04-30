" ===
" === basic
" ===
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix,dos,mac

if &compatible
    set nocompatible " Be iMproved
endif
let g:mapleader = ' '
set noautochdir
set autoread

" for gvim and neovim gui, currently dotnvim or neovide
if has('gui_running') || exists('g:gui_dotnvim') || exists('g:neovide')
    let &guifont='Hasklug Nerd Font:h12'
    let &guifontwide='Hasklug Nerd Font:h12'
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set lines=30
    set columns=120
endif

" display
filetype plugin indent on
syntax enable
set scrolloff=5
set number
set relativenumber
set cursorline
set cursorcolumn
" let &colorcolumn="81,".join(range(121,999),",")
let &colorcolumn="81,121"
set textwidth=80
set hidden
set noshowmode
set showcmd
set mouse=
set nowrap
set linebreak
set timeout           " for mappings
set timeoutlen=800
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value
set updatetime=50
set conceallevel=0
set wildmenu
if !has('nvim') && v:version > 802
    set wildoptions=pum
endif
set nolazyredraw
set ttyfast

" set t_Co=256
if has("termguicolors")
    set termguicolors
    if !has('nvim')
        " fix the termguicolors black and white in vim
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
endif

if g:osv_plug_general == 0
    set laststatus=2
else
    set laststatus=0
endif
set cmdheight=1
set spelllang=en,cjk  " Spell languages
set spellfile=$CONF_PATH/spell/en.utf-8.add
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
set showmatch
" set iskeyword+=_,$,@,%,#,:
set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]

" search
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase

" indent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab  " 将Tab自动转化成空格(需要输入真正的Tab键时，使用 Ctrl+V + Tab)
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
set completeopt=menuone,noselect,noinsert,preview
set dictionary+=$CONF_PATH/dictionary/20k.txt

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
    silent exec "!mkdir -p " . $CONF_PATH . "/tmp/backup"
    silent exec "!mkdir -p " . $CONF_PATH . "/tmp/undo"
    silent exec "!mkdir -p " . $CONF_PATH . "/tmp/swap"
    OsvInfo("Creating the tmp dir!")
    call input('Press any key to continue')
endif

set undofile
set swapfile
set backup
set undodir=$CONF_PATH/tmp/undo
set backupdir=$CONF_PATH/tmp/backup
set directory=$CONF_PATH/tmp/swap

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
"
if g:osv_file_explorer == 'none'
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
else " disable all of the buildins
    let g:loaded_gzip = 1
    let g:loaded_tar = 1
    let g:loaded_tarPlugin = 1
    let g:loaded_zip = 1
    let g:loaded_zipPlugin = 1

    let g:loaded_getscript = 1
    let g:loaded_getscriptPlugin = 1
    let g:loaded_vimball = 1
    let g:loaded_vimballPlugin = 1

    " let g:loaded_matchit = 1
    " let g:loaded_matchparen = 1
    let g:loaded_2html_plugin = 1
    let g:loaded_logiPat = 1
    let g:loaded_rrhelper = 1

    let g:loaded_netrw = 1
    let g:loaded_netrwPlugin = 1
    let g:loaded_netrwSettings = 1
    let g:loaded_netrwFileHandlers = 1
endif

" ===
" === Terminal Behaviors
" ===
if exists('##TerminalOpen')
    tnoremap <C-N> <C-\><C-N>
    augroup term_open_settings
        autocmd!
        autocmd TerminalOpen * startinsert
    augroup END
endif
if has('nvim')
    let g:terminal_color_0  = '#000000'
    let g:terminal_color_1  = '#FF5555'
    let g:terminal_color_2  = '#50FA7B'
    let g:terminal_color_3  = '#F1FA8C'
    let g:terminal_color_4  = '#BD93F9'
    let g:terminal_color_5  = '#FF79C6'
    let g:terminal_color_6  = '#8BE9FD'
    let g:terminal_color_7  = '#BFBFBF'
    let g:terminal_color_8  = '#4D4D4D'
    let g:terminal_color_9  = '#FF6E67'
    let g:terminal_color_10 = '#5AF78E'
    let g:terminal_color_11 = '#F4F99D'
    let g:terminal_color_12 = '#CAA9FA'
    let g:terminal_color_13 = '#FF92D0'
    let g:terminal_color_14 = '#9AEDFE'
endif

if has('terminal')&&!has('nvim')
    let g:terminal_ansi_colors = [
                \'#4e4e4e',
                \'#d68787',
                \'#5f865f',
                \'#d8af5f',
                \'#85add4',
                \'#d7afaf',
                \'#87afaf',
                \'#d0d0d0',
                \'#626262',
                \'#d75f87',
                \'#87af87',
                \'#ffd787',
                \'#add4fb',
                \'#ffafaf',
                \'#87d7d7',
                \'#e4e4e4',
                \]
endif

" ===
" === colorscheme
" ===
set background=dark
colorscheme onehalfdark
