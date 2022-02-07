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


if g:os_name == 'Linux' || g:os_name == 'Windows'
    " ===
    " === Snippets
    " ===
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " ===
    " === python
    " ===
    if g:os_name == 'Linux' && has('nvim')
        Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
    endif

    " ===
    " === Latex
    " ===
    if executable('latexmk')
        Plug 'lervag/vimtex'
    endif

    " ===
    " === deoplete (works well with the omnifunc in vim)
    " ===
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

    " ===
    " === deoplete plugins
    " ===
    Plug 'Shougo/neopairs.vim'

    if g:os_name == 'Windows'
        Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
    elseif g:os_name == 'Linux'&&g:os_architect =='x86_64'
        Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
    endif

    " ===
    " === deoplete + languages support
    " ===
    if g:os_name == 'Linux'
        " vim-lsp + deoplete
        Plug 'lighttiger2505/deoplete-vim-lsp'
        Plug 'prabirshrestha/vim-lsp'
        Plug 'prabirshrestha/async.vim'
        " c++
        if executable('ccls')
            Plug 'jackguo380/vim-lsp-cxx-highlight'
        endif
    elseif g:os_name == 'Windows'
        " for windows, use the deoplete-plugins
        Plug 'deoplete-plugins/deoplete-jedi'
    endif

endif
