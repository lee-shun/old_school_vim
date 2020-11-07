"**************************************************************************************************
"
"
"  _                    _   _                 _
" | |    ___  ___      | \ | | ___  _____   _(_)_ __ ___  _ __ ___
" | |   / _ \/ _ \_____|  \| |/ _ \/ _ \ \ / / | '_ ` _ \| '__/ __|
" | |__|  __/  __/_____| |\  |  __/ (_) \ V /| | | | | | | | | (__
" |_____\___|\___|     |_| \_|\___|\___/ \_/ |_|_| |_| |_|_|  \___|
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
filetype on
filetype plugin on
set autochdir "自动切换工作目录

"****************************************基本设置区************************************************
"编码设置
set encoding=UTF-8

"显示设置
syntax on             " 设置高亮
set scrolloff=5       " 设置滚动余量
"set mouse=a           " 打开鼠标
"colorscheme evening   "设置默认颜色
set number            " 打开行号
set relativenumber    " 相对行号
set cursorline        " 打开光标提示线
set cursorcolumn      " 打开光标提示线
set noshowmode        " 不要显示模式
set nowrap            " 显示行折叠
set linebreak         " 不在单词内部折行
set ttimeoutlen=0     " 单字符命令等待时间
set wildmenu          " vim命令自动补全
set foldmethod=manual " 语法折叠
set nofoldenable      " 开始关闭语法折叠
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

"缩进设置
filetype indent on
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"显示非可见字符
" UI Symbols
" icons:  ▏│ ¦ ╎ ┆ ⋮ ⦙ ┊ 
set list
set listchars=tab:\-\ ,trail:▫
" set listchars=extends:>,precedes:<,nbsp:␣
let &showbreak='↳  '

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

noremap M J "合并行
noremap S :w<CR>
noremap Q :q<CR>
noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l

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

noremap <LEADER>b1 :buffer 1<CR>
noremap <LEADER>b2 :buffer 2<CR>
noremap <LEADER>b3 :buffer 3<CR>
noremap <LEADER>b4 :buffer 4<CR>
noremap <LEADER>b5 :buffer 5<CR>
noremap <LEADER>b6 :buffer 6<CR>
noremap <LEADER>b7 :buffer 7<CR>
noremap <LEADER>b8 :buffer 8<CR>
noremap <LEADER>b9 :buffer 9<CR>

"**************************************编辑neovimrc********************************************
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>


"**************************************文件关闭光标记忆********************************************

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"****************************************外部程序启动**********************************************

" Open up lazygit
noremap <c-g>  :term lazygit<CR>

"************************************双击查找下一个占位符******************************************

noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

"************************************C++单行注释方式改变******************************************

noremap <LEADER>c <Esc>k^/\/\/<CR>d2lv$hdA/* */<Esc>2hP$:set nohlsearch<CR>

"****************************************快速移动行************************************************

nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

"****************************************快速添加空行**********************************************

nnoremap [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"****************************************快速选中查找**********************************************
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"****************************************存储历史记录**************************************************
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions

set undofile
set swapfile
set nobackup
set undodir=~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup
set directory=~/.config/nvim/tmp/backup

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

"****************************************有用函数**************************************************

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'vimwiki'
		exec "MarkdownPreview"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
