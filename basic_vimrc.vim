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

"===
"=== basic
"===
set encoding=utf-8                                                      " 设置新文件的编码为 UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 自动判断编码时，依次尝试以下编码：
set helplang=cn
" set langmenu=zh_CN.UTF-8
" set enc=2byte-gb18030
set termencoding=utf-8                                                  " 下面这句只影响普通模式 (非图形界面) 下的 Vim
set ffs=unix,dos,mac                                                    " Use Unix as the standard file type

" NOTE: if directly use 'set ..', it will be reset by the buildin vimscripts.
augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions+=m formatoptions+=B formatoptions-=o
    " This can be done as well instead of the previous line, for setting formatoptions as you choose:
    " autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END

set nocompatible
let g:mapleader = ' '
set autochdir
set autoread
filetype plugin indent on

" display
syntax on
set scrolloff=5
set number
set relativenumber
set cursorline
set cursorcolumn
set colorcolumn=121
set textwidth=120
set hidden
set showmode
set showcmd
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
set laststatus=2
set cmdheight=1
set spelllang=en,cjk  " Spell languages
" Align indent to next multiple value of shiftwidth. For its meaning,
" see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround
" Virtual edit is useful for visual block edit
set virtualedit=block


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
set clipboard+=unnamed
set clipboard+=unnamedplus

"===
"=== built-in completion
"===
set complete+=k
set completeopt=menuone,noselect,noinsert
set dictionary+=$CONF_PATH/20k

inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

"===
"=== quick mapping
"===
noremap <LEADER>rc :e $CONF_PATH/init.vim<CR>
nnoremap <F2> :set relativenumber! number!<CR>
nnoremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
nnoremap <C-h> :set hlsearch!<CR>

"===
"=== window split
"===
set splitright
set splitbelow

nnoremap <up> :res +5<CR>
nnoremap <down> :res -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>

nnoremap <C-A-up> <nop>
nnoremap <C-A-down> <nop>
nnoremap <C-A-left> <nop>
nnoremap <C-A-right> <nop>
inoremap <C-A-up> <nop>
inoremap <C-A-down> <nop>
inoremap <C-A-left> <nop>
inoremap <C-A-right> <nop>

"===
"=== save the cursor line position
"===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"===
"=== change the cursor shape(works on alacritty,but change the fonts in git bash)
"===
if !has('nvim')
    " Change cursor shapes based on whether we are in insert mode,
    " see https://vi.stackexchange.com/questions/9131/i-cant-switch-to-cursor-in-insert-mode
    let &t_SI = "\<esc>[6 q"
    let &t_EI = "\<esc>[2 q"
    if exists('&t_SR')
        let &t_SR = "\<esc>[4 q"
    endif

endif

"===
"=== add and move line
"===
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
nnoremap [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" change indent and select in v-mode
xnoremap <  <gv
xnoremap >  >gv

"===
"=== search the chosen
"===
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"===
"=== modify history
"===
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

"===
"=== ignore some file types
"===
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.pdf

"===
"=== better file type
"===
au BufNewFile,BufRead *.launch set filetype=xml

"===
"=== build-in netrw
"===

if g:pure_vim_mini==1
    nnoremap <LEADER>t :Vex<CR>
endif
let g:netrw_hide = 1
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 24
let g:netrw_altv = 1
let g:netrw_chgwin = 2
let g:netrw_list_hide = '.*\.swp$'
let g:netrw_localrmdir = 'rm -rf'

"===
"=== status line
"===
if g:pure_vim_mini==1
    source $CONF_PATH/statusline.vim
endif

"===
"=== themes
"===
if g:pure_vim_mini==1
    source $CONF_PATH/themes.vim
endif

"===
"=== auto setting command
"===
if exists('##CmdLineEnter')
    augroup dynamic_smartcase
        autocmd!
        autocmd CmdLineEnter : set nosmartcase
        autocmd CmdLineLeave : set smartcase
    augroup END
endif

if exists('##TermOpen')
    augroup term_settings
        autocmd!
        " Do not use number and relative number for terminal inside nvim
        autocmd TermOpen * setlocal norelativenumber nonumber
        " Go to insert mode by default to start typing command
        autocmd TermOpen * startinsert
    augroup END
endif

" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Display a message when the current file is not in utf-8 format.
" Note that we need to use `unsilent` command here because of this issue:
" https://github.com/vim/vim/issues/4379. For older Vim (version 7.4), the
" help file are in gzip format, do not warn this.
augroup non_utf8_file_warn
    autocmd!
    autocmd BufRead * if &fileencoding != 'utf-8' && expand('%:e') != 'gz'
                \ | unsilent echomsg 'File not in UTF-8 format!' | endif
augroup END

augroup number_toggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &number | set relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &number | set norelativenumber | endif
augroup END
