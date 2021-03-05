"**************************************************************************************************
"    __  __        __     _____ __  __ ____   ____
"   |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
"   | |\/| | | | |  \ \ / / | || |\/| | |_) | |
"   | |  | | |_| |   \ V /  | || |  | |  _ <| |___
"   |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"           |___/
"
"
"File   : basic.vim
"
"Author : lee-shun
"
"Email  : 2015097272@qq.com
"
"**************************************************************************************************


"**************************************交换文件设置区**********************************************

"****************************************基本设置区************************************************

let g:mapleader = ' '
set autochdir "自动切换工作目录
filetype plugin indent on

"****************************************基本设置区************************************************
"编码设置
set encoding=UTF-8

"显示设置
" syntax on             " 设置高亮
set scrolloff=5       " 设置滚动余量
"set mouse=a           " 打开鼠标
"colorscheme evening   "设置默认颜色
set number            " 打开行号
set relativenumber    " 相对行号
set cursorline        " 打开光标提示线
set cursorcolumn      " 打开光标提示线
set colorcolumn=121   " 设置80列提示
set noshowmode        " 不要显示模式
set nowrap            " 显示行折叠
set linebreak         " 不在单词内部折行
set ttimeoutlen=0     " 单字符命令等待时间
set wildmenu          " vim命令自动补全
set lazyredraw        " same as above
set visualbell
set ttyfast           " should make scrolling faster
set t_Co=256          " 256颜色

if has('nvim')
    set termguicolors     " 使用gui，不和终端混合
endif

"搜索设置
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
noremap <C-h> :set nohlsearch!<CR>

"缩进与折叠
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set foldmethod=manual " 手动折叠
set foldlevel=99      " 折叠文件打开展开
set foldenable

"显示非可见字符
" UI Symbols
" icons:  ▏│ ¦ ╎ ┆ ⋮ ⦙ ┊ 
set list
set listchars=tab:\•\ ,trail:▫
" set listchars=extends:>,precedes:<,nbsp:␣
let &showbreak='↳'

"共享设置
set clipboard=unnamedplus

"设置拼写检查
noremap <LEADER>sc :set spell!<CR>

"设置插入模式下自动提示
inoremap <C-x> <C-x>s

"************************************自动刷新vimrc*************************************************

"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"***********************************宏快捷键*******************************************************

noremap <LEADER>= @a

"**************************************移动映射**************************************************

nnoremap M J "合并行
nnoremap <home> H
nnoremap <end> L
nnoremap S :w<CR>
nnoremap Q :q<CR>
nnoremap J 5j
nnoremap K 5k
nnoremap H 5h
nnoremap L 5l

vnoremap M J "合并行
vnoremap <home> H
vnoremap <end> L
vnoremap S :w<CR>
vnoremap Q :q<CR>
vnoremap J 5j
vnoremap K 5k
vnoremap H 5h
vnoremap L 5l

"**************************************共享剪切板**************************************************

"共享剪切板
"vnoremap <Leader>y "+y
"vnoremap <Leader>yy "+yy
"nmap <Leader>p "+p

"**************************************行号设置**************************************************

nnoremap <F2> :set relativenumber! number!<CR>

"**************************************分屏设置区**************************************************
set splitright
set splitbelow
noremap <LEADER>sv :set splitright<CR>:vsplit<CR>
noremap <LEADER>sl :split<CR>
noremap <LEADER>l <C-w>l
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>w <C-w>w

nnoremap <up> :res +5<CR>
nnoremap <down> :res -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>

"**************************************ctrl-alt工作区冲突******************************************

nnoremap <C-A-up> <nop>
nnoremap <C-A-down> <nop>
nnoremap <C-A-left> <nop>
nnoremap <C-A-right> <nop>
inoremap <C-A-up> <nop>
inoremap <C-A-down> <nop>
inoremap <C-A-left> <nop>
inoremap <C-A-right> <nop>

"**************************************标签设置区**************************************************

noremap te :tabe<CR>
noremap tp :-tabnext<CR>
noremap tn :+tabnext<CR>
noremap tc :tabclose<cr>
noremap tm :tabmove

"**************************************Buffer设置区************************************************

noremap <LEADER>bn :bn<CR>
noremap <LEADER>bp :bp<CR>
noremap <LEADER>bd :bd<CR>

"**************************************编辑neovimrc********************************************

noremap <LEADER>rc :e ~/.vim/vimrc<CR>

"**************************************文件关闭光标记忆********************************************

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"****************************************外部程序启动**********************************************

"************************************双击查找下一个占位符******************************************

nnoremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

"************************************C++单行注释方式改变******************************************

nnoremap <LEADER>c <Esc>k^/\/\/<CR>d2lv$hdA/* */<Esc>2hP$:set nohlsearch<CR>

"************************************C++注释更改******************************************

nnoremap cic <Esc>0f*2lvt*hc

"****************************************快速移动行************************************************

nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

"****************************************快速添加空行**********************************************

nnoremap [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"****************************************快速选中查找**********************************************
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"****************************************存储历史记录**************************************************
silent !mkdir -p ~/.vim/tmp/backup
silent !mkdir -p ~/.vim/tmp/undo
" silent !mkdir -p ~/.vim/tmp/sessions

set undofile
set swapfile
set nobackup
set undodir=~/.vim/tmp/undo
set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/backup

"****************************************内置终端**************************************************
" ===
" === Terminal Behaviors
" ===
if has('nvim')
    let g:neoterm_autoscroll = 1
    autocmd TermOpen term://* startinsert
    tnoremap <C-N> <C-\><C-N>
    tnoremap <C-O> <C-\><C-N><C-O>
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
