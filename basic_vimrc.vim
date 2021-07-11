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

"basic
set encoding=UTF-8
let g:mapleader = ' '
set autochdir
filetype plugin indent on

"display
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
set ttimeoutlen=0
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
set expandtab

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
"===built-in completion
"===
set complete+=k
set completeopt=menuone,noselect,noinsert
set dictionary+=$CONF_PATH/20k

inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

"===
"===quick mapping
"===
noremap <LEADER>rc :e $CONF_PATH/init.vim<CR>
nnoremap <F2> :set relativenumber! number!<CR>
nnoremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
nnoremap <C-h> :set hlsearch!<CR>

"===
"===window split
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
"===save the cursor line position
"===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"===
"===add and move line
"===
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
nnoremap [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"===
"===search the chosen
"===
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"===
"===modify history
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
"===ignore some file types
"===
if has('win32')
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
elseif has('mac')
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOS/Linux
elseif has('unix')
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOS/Linux
endif

"===
"===build-in netrw
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
