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

" basic
set encoding=utf-8                                                      " 设置新文件的编码为 UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 自动判断编码时，依次尝试以下编码：
set helplang=cn
" set langmenu=zh_CN.UTF-8
" set enc=2byte-gb18030
set termencoding=utf-8                                                  " 下面这句只影响普通模式 (非图形界面) 下的 Vim

set ffs=unix,dos,mac                                                    " Use Unix as the standard file type

set formatoptions+=m                                                    " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B                                                    " 合并两行中文时，不在中间加空格

let g:mapleader = ' '
set autochdir
filetype plugin indent on

" display
syntax on
set scrolloff=5
set number
set relativenumber
set cursorline
set cursorcolumn
set colorcolumn=121
set noshowmode
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
let &showbreak='↳'

" share clipboard
set clipboard=unnamedplus

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
if empty($ALACRITTY_LOG) || has('nvim')
  " if terminal is not alacritty or nvim running, don't use
  else
  if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
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
if has('win32')
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
elseif has('mac')
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOS/Linux
elseif has('unix')
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOS/Linux
endif

"===
"=== build-in netrw
"===
let g:netrw_hide = 1
let g:netrw_liststyle = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 24
let g:netrw_altv = 1
let g:netrw_chgwin = 2
let g:netrw_list_hide = '.*\.swp$'
let g:netrw_localrmdir = 'rm -rf'

"===
"=== better file type
"===
au BufNewFile,BufRead *.launch set filetype=xml
