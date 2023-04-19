" the dein version
if has('nvim')
    if has('nvim-0.8')
        let g:osv_dein_version = 'master'
    elseif has('nvim-0.5')
        let g:osv_dein_version = '3.1'
    elseif has('nvim-0.2')
        let g:osv_dein_version = '2.2'
    else
        let g:osv_dein_version = '1.5'
    endif
else " vim
    if v:version >= 802
        let g:osv_dein_version = 'master'
    elseif v:version >= 800
        let g:osv_dein_version = '2.2'
    elseif v:version >= 704
        let g:osv_dein_version = '1.5'
    endif
endif

let s:dein_dir = $CONF_PATH.'/dein'
let s:dein_src = $CONF_PATH.'/dein/repos/github.com/Shougo/dein.vim'

" install dein for the first time
let g:osv_setup = 0
if empty(glob(s:dein_dir))
    let g:osv_setup = 1
    silent exec "!git clone --depth 1 --branch" g:osv_dein_version " https://github.com/Shougo/dein.vim " s:dein_src
    echom "install dein" g:osv_dein_version "to" s:dein_src
endif
set runtimepath+=$CONF_PATH/dein/repos/github.com/Shougo/dein.vim

call dein#begin(s:dein_dir)

if g:osv_plug_general == 1
    source $CONF_PATH/plug_list/norm/plug_general.vim
    source $CONF_PATH/plug_list/lazy/plug_general.vim
endif

if g:osv_plug_advanced == 1
    source $CONF_PATH/plug_list/lazy/plug_advanced.vim
endif

if g:osv_plug_coc == 1
    source $CONF_PATH/plug_list/lazy/plug_coc.vim
endif
if g:osv_plug_lsp == 1
    source $CONF_PATH/plug_list/lazy/plug_lsp.vim
endif
if g:osv_plug_deoplete == 1
    source $CONF_PATH/plug_list/lazy/plug_deoplete.vim
endif
if g:osv_plug_asyncomplete == 1
    source $CONF_PATH/plug_list/lazy/plug_asyncomplete.vim
endif

call dein#end()

augroup DeinSetup
    autocmd!
    autocmd VimEnter * call dein#call_hook('post_source')
augroup END

if g:osv_setup == 1
    call dein#update()
    echo "install the plugins with dein#update()."
    if has('nvim')
        silent exec "UpdateRemotePlugins"
    endif
endif

" Run update every day automatically when entering Vim.
if g:osv_setup == 0
    function! AutoUpdateVimPlug() abort
        let l:filename = $CONF_PATH.'/tmp/plug_update_time'
        if filereadable(l:filename) == 0
            call writefile([], l:filename)
        endif
        let l:today = strftime('%Y_%m_%d')
        let l:contents = readfile(l:filename)

        if index(l:contents, l:today) < 0

            " update the repo first
            let l:osv_update = input("upgrade old school vim with remote, [y/n]?\n")
            if l:osv_update == 'y'
                let l:git_clean = system("cd ".$CONF_PATH." && git status --porcelain 2>/dev/null") is# ''
                if l:git_clean == 1
                    call system("!cd ".$CONF_PATH." && git pull && cd -")
                    echo "update the old school vim via git!"
                else
                    echohl WarningMsg
                    echo "git status is not clean!"
                    echohl None
                endif
            endif

            " update the plugins
            let l:choice = input("upgrade vim plugs, [y/n]?\n")
            if l:choice == 'y'
                call dein#update()
            endif

            call writefile([l:today], l:filename, 'a')
        endif
    endfunction

    augroup AutoUpdatePlugGroup
        autocmd!
        autocmd VimEnter * call AutoUpdateVimPlug()
    augroup END

endif
