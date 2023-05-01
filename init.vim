"*******************************************************************************
"                                                                              "
"          .oOOOo.   o      o       .oOOOo.         o                 o        "
"         .O     o. O      O        o     o        O                 O         "
"         O       o o      o        O.             o                 o         "
"         o       O O      o         `OOoo.        O                 O         "
"         O       o o  .oOoO              `O .oOo  OoOo. .oOo. .oOo. o         "
"         o       O O  o   O               o O     o   o O   o O   o O         "
"         `o     O' o  O   o        O.    .O o     o   O o   O o   O o         "
"          `OoooO'  Oo `OoO'o        `oooO'  `OoO' O   o `OoO' `OoO' Oo        "
"                                                                              "
"  Author : lee-shun                                                           "
"                                                                              "
"  Email  : 2015097272@qq.com                                                  "
"                                                                              "
"*******************************************************************************

" ===
" === env check
" ===
let $CONF_PATH = split(&runtimepath, ',')[0]

function! OsvInfo(message) abort
    echomsg a:message | echo ""
    return 0
endfunction

function! OsvWarn(message) abort
    if g:osv_warning == 0
        return 0
    endif
    echohl WarningMsg
    echomsg a:message | echo ""
    echohl None
    return 0
endfunction

function! OsvErr(message) abort
    echohl ErrorMsg
    echomsg a:message | echo ""
    echohl None
    return 0
endfunction

if !has('nvim') && v:version < 704
    OsvErr('Osv needs vim >= 7.4 or nvim! Finish!')
    finish
endif

if !exists("g:os_name")
    if has("win64") || has("win32") || has("win16")
        let g:os_name = "Windows"
        let g:os_architect = 'x86_64'
        set shell=C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe
        set shellcmdflag=-command
        set shellquote=\"
        set shellxquote=
    else " not windows, use 'uname' command.
        let g:os_name = substitute(system('uname'), '\n', '', '')
        let g:os_architect =substitute(system('uname -m'), '\n', '', '')
    endif
endif

if g:os_name == 'Windows' && has('nvim') " nvim on win
    let g:python3_host_prog='C:\ProgramData\Anaconda3\python.exe'
elseif g:os_name == 'Linux'
    if executable('conda')
        let g:python_host_prog='/usr/bin/python'
        let g:python3_host_prog='python'
    else
        let g:python_host_prog='/usr/bin/python'
        let g:python3_host_prog='/usr/bin/python3'
    endif
endif

if has('nvim')
    let g:has_popup = exists('*nvim_win_set_config') && has('nvim-0.4.2')
else
    let g:has_popup = exists('*popup_create') && has('patch-8.2.191')
endif

" ===
" === get the modules
" ===
let g:osv_warning = 1
let g:osv_plug_general = 1
let g:osv_plug_advanced = 0
let g:osv_finder = 'none'
let g:osv_file_explorer = 'none'
let g:osv_complete_engine = 'none'
let g:osv_vim_lsp = 0

" customs
if !empty(glob($CONF_PATH.'/custom_modules.vim'))
    source $CONF_PATH/custom_modules.vim
else
    " copy the custom_modules out.
    call system("cp -r ".$CONF_PATH."/template/custom_modules.vim.template ".$CONF_PATH."/custom_modules.vim")
    call OsvInfo("You may want to define your own modules in ".$CONF_PATH."/custom_modules.vim later on.")
    call input("Press any key to continue...")
endif

" ===
" === check the finder
" ===
if g:osv_finder == 'coc-lists'
    if g:osv_complete_engine != 'coc'
        call OsvErr("coc-lists needs the coc.nvim to be used as completion engine. Skip!")
        let g:osv_finder = 'none'
        finish
    endif
elseif g:osv_finder == 'fzf'
    if !executable('ag')
        call OsvWarn("Need the silver searcher (ag) to run fzf.vim!")
    endif
    if !executable('rg')
        call OsvWarn("Need the ripgrep (rg) to run fzf.vim!")
    endif
    if !executable('batcat')
        call OsvWarn("Need bat(cat) to run the syntax highlight preview in fzf.vim!")
    endif
elseif g:osv_finder == 'ctrlp'
    if v:version < 700 && !has('nvim')
        call OsvErr("Need nvim or vim >= 7 to use ctrlp. Skip!")
        let g:osv_finder = 'none'
        finish
    endif
    if !executable('ag')
        call OsvWarn("Need the silver searcher (ag) to run ctrlp!")
    endif
elseif g:osv_finder == 'leaderf'
    if !has('patch-7.4.1126') && !has('nvim')
        call OsvErr("Need nvim or vim >= 7.4.1126 to use leaderf. Skip!")
        let g:osv_finder = 'none'
        finish
    endif
    if !has('python3')
        call OsvErr("Need python3 to use leaderf. Skip!")
        let g:osv_finder = 'none'
        finish
    endif
    if !executable('rg')
        call OsvWarn("Need the ripgrep (rg) to run leaderf!")
    endif
elseif g:osv_finder == 'clap'
    if g:os_architect == 'aarch64'
        call OsvErr("Do not use clap under aarch64. Skip!")
        let g:osv_finder = 'none'
        finish
    endif
    if !has('patch-8.1.2114') && !has('nvim-0.4.2')
        call OsvErr("Need nvim >= 0.4.2 or vim >= 8.1.2114 to use clap. Skip!")
        let g:osv_finder = 'none'
        finish
    endif
    if !executable('rg')
        call OsvWarn("Need the ripgrep (rg) to run clap!")
    endif
endif

" ===
" === check the file explorer
" ===
if g:osv_file_explorer == 'coc-explorer'
    if g:osv_complete_engine != 'coc'
        call OsvWarn("coc-explorer needs the coc.nvim to be used as completion engine. Skip!")
        let g:osv_file_explorer = 'none'
    endif
elseif g:osv_file_explorer == 'defx'
    if has('nvim-0.4') || v:version > 802 " according to the repo
        " defx.nvim is ok
    else
        call OsvErr("Need nvim >= 0.4 or vim >= 8.2 to use defx.nvim. Skip!")
        let g:osv_file_explorer = 'none'
        finish
    endif
elseif g:osv_file_explorer == 'fern'
    if has('nvim') || has('patch-8.1.2269') " according to the repo
        " fern.vim is ok
    else
        call OsvErr("Need nvim or vim >= 8.1.2269 to use fern.vim. Skip!")
        let g:osv_file_explorer = 'none'
        finish
    endif
elseif g:osv_file_explorer == 'vimfiler'
    " vimfiler is ok
endif

" ===
" === check the complete engine
" ===
if g:osv_complete_engine == 'coc'
    " don't use coc under aarch64
    if !executable('npm')
        call OsvErr("Please install nodejs to use coc. Skip!")
        let g:osv_complete_engine = 'none'
        finish
    endif

    " don't use coc with vim under version 8.1-1719
    if !has('nvim-0.4') && !has('patch-8.1.1719')
        call OsvErr("For coc.nvim: vim>=8.1.1719 or nvim>=0.4! Skip!")
        let g:osv_complete_engine = 'none'
        finish
    endif

    if g:osv_vim_lsp == 1
        call OsvWarn("coc.nvim already has the lsp support! No need to install vim-lsp!")
        let g:osv_vim_lsp = 0
    endif
elseif g:osv_complete_engine == 'deoplete'
    " don't use deoplete with vim under version 8.2.1978 or nvim < 0.3
    if !has('python3')
        call OsvErr("Deoplete.nvim needs python3 support! Skip!")
        let g:osv_complete_engine = 'none'
        finish
    endif
    if !has('nvim-0.3') && !has('patch-8.2.1978')
        call OsvErr("For deoplete.nvim: vim>=8.2.1978 or nvim>=0.3! Skip!")
        let g:osv_complete_engine = 'none'
        finish
    endif
elseif g:osv_complete_engine == 'asyncomplete'
    " don't use asyncomplete with vim under version 8 or nvim
    if !has('nvim') && v:version< 800
        call OsvErr("For asyncomplete.nvim: vim>=8.0 or nvim! Skip!")
        let g:osv_complete_engine = 'none'
        finish
    endif
endif

" ===
" === check the vim-lsp
" ===

" don't use lsp with vim under version 8.0
if !has('nvim') && v:version < 800 && g:osv_vim_lsp == 1
    call OsvErr("For vim-lsp: vim>=8.0 or nvim! Skip!")
    let g:osv_vim_lsp = 0
    finish
endif

" ===
" === basic config
" ===
source $CONF_PATH/basic/options.vim
source $CONF_PATH/basic/mappings.vim

" ===
" === plug
" ===
source $CONF_PATH/plug_list/plug_init.vim

filetype plugin indent on
syntax enable
