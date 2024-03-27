" ===
" === check the dein version
" ===
if has('nvim')
    if has('nvim-0.8')
        let s:osv_dein_version = 'master'
    elseif has('nvim-0.5')
        let s:osv_dein_version = '3.1'
    elseif has('nvim-0.2')
        let s:osv_dein_version = '2.2'
    else
        let s:osv_dein_version = '1.5'
    endif
else " vim
    if v:version >= 802
        let s:osv_dein_version = 'master'
    elseif v:version >= 800
        let s:osv_dein_version = '2.2'
    elseif v:version >= 704
        let s:osv_dein_version = '1.5'
    endif
endif

let s:dein_cache_dir = $CONF_PATH.'/dein'
let s:version_tail = s:osv_dein_version=='master' ? '' : '_'.s:osv_dein_version
if g:osv_repo_source == 'origin'
    let s:dein_src = $CONF_PATH.'/dein/repos/github.com/Shougo/dein.vim' . s:version_tail
    let g:dein#types#git#default_hub_site = 'github.com'
elseif g:osv_repo_source == 'mirror'
    let s:dein_src = $CONF_PATH.'/dein/repos/gitee.com/old_school_vim/dein.vim' . s:version_tail
    let g:dein#types#git#default_hub_site = 'gitee.com'
endif

" install dein for the first time
let s:osv_first_setup = 0
if empty(glob(s:dein_src))
    let s:osv_first_setup = 1

    let s:input_repo_source = input("Choose OSV REPO SOURCE? [o(rigin)/m(irror)]?\n")

    if s:input_repo_source == 'o' || s:input_repo_source == 'origin'
        let g:osv_repo_source = 'origin'
    elseif s:input_repo_source == 'm' || s:input_repo_source == 'mirror'
        let g:osv_repo_source = 'mirror'
    else
        call osv_ultis#msg#err(g:osv_repo_source." is a wrong repo source type: [o(rigin)/m(irror)]! Finish!")
        finish
    endif

    " write the choice into the custom_modules.vim
    let s:custom_modules_content = readfile($CONF_PATH."/custom_modules.vim")
    for i in range(len(s:custom_modules_content))
        let ele = split(s:custom_modules_content[i], " = ")
        if !empty(ele) && ele[0] == "let g:osv_repo_source"
            let s:custom_modules_content[i] = "let g:osv_repo_source = " . "'" . g:osv_repo_source . "'"
            break
        endif
    endfor
    call writefile(s:custom_modules_content, $CONF_PATH."/custom_modules.vim")

    " install dein.vim
    if g:osv_repo_source == 'origin'
        call osv_ultis#system#exec("git clone --branch ".s:osv_dein_version." https://github.com/Shougo/dein.vim " . s:dein_src)
    elseif g:osv_repo_source == 'mirror'
        call osv_ultis#system#exec("git clone --branch ".s:osv_dein_version." https://gitee.com/old_school_vim/dein.vim " . s:dein_src)
    endif

    " check if the dein is successfully installed.
    if empty(glob(s:dein_src))
        call osv_ultis#msg#err("Failed to install dein ".s:osv_dein_version." to ".s:dein_src . '! Finish!')
        finish
    else
        call osv_ultis#msg#info("Successfully install dein ".s:osv_dein_version." to ".s:dein_src . '!')
        call input("Press any key to continue...")
    endif

endif

let &runtimepath.=','.s:dein_src
call dein#begin(s:dein_cache_dir)

" add dein.vim as a local plugin
call dein#add(s:dein_src)
let $OSV_REPO_SOURCE = g:osv_repo_source

if g:osv_debug == 1
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_debug.vim
endif

if g:osv_plug_general == 1
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_general.vim
endif

if g:osv_plug_advanced == 1
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_advanced.vim
endif

source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_snippet.vim

source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_finder.vim

source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_file_explorer.vim

if g:osv_complete_engine == 'coc'
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_coc.vim
endif

if g:osv_complete_engine == 'deoplete'
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_deoplete.vim
endif

if g:osv_complete_engine == 'asyncomplete'
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_asyncomplete.vim
endif

if g:osv_complete_engine == 'mucomplete'
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_mucomplete.vim
endif

if g:osv_complete_engine == 'vimcomplete'
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_vimcomplete.vim
endif

if g:osv_linter == 'ale'
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_ale.vim
endif

if g:osv_lsp == 'vim-lsp'
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_lsp.vim
endif

if g:osv_lsp == 'lcn'
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_lcn.vim
endif

if g:osv_lsp == 'vim-lsc'
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_lsc.vim
endif

if g:osv_lsp == 'vim9lsp'
    source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_vim9lsp.vim
endif

source $CONF_PATH/plug_list/$OSV_REPO_SOURCE/plug_ai.vim

call dein#end()

augroup DeinSetup
    autocmd!
    autocmd VimEnter * call dein#call_hook('source') | call dein#call_hook('post_source')
augroup END

if s:osv_first_setup == 1
    call dein#update()
    call osv_ultis#msg#info("install the plugins with dein#update().")
    if has('nvim') && has('python3')
        execute "UpdateRemotePlugins"
    endif
    call input("press any key to restart the osv...")
    quit!
endif
