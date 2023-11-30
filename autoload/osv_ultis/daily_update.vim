" ===
" === Run update every day automatically when entering Vim.
" ===

function! osv_ultis#daily_update#daily_update_osv() abort
    let l:filename = $CONF_PATH.'/tmp/plug_update_time'
    let l:today = strftime('%Y_%m_%d')

    if filereadable(l:filename) == 0
        call writefile([l:today], l:filename, 'a')
    endif

    let l:contents = readfile(l:filename)

    if index(l:contents, l:today) < 0

        " update the repo first
        let l:osv_update = input("Update old school vim with remote, [y/n]?\n")
        if l:osv_update == 'y'
            let l:git_clean = osv_ultis#system#exec(["cd ".$CONF_PATH, "git status -s"]) is# ''
            if l:git_clean == 1
                call osv_ultis#system#exec(["cd ".$CONF_PATH, "git pull"])
            else
                call osv_ultis#msg#err("git status is not clean!")
                let l:force_update = input("Force update? [y/n]?\n")
                if l:force_update == 'y'
                    call osv_ultis#system#exec(
                                \["cd ".$CONF_PATH,
                                \ "git fetch",
                                \ "git reset --hard origin/master",
                                \ "git pull"]
                                \)
                else
                    call osv_ultis#msg#info("Skip force updating!")
                endif
            endif
        else " do not update
            call osv_ultis#msg#info("Skip updating old school vim!")
        endif

        " update the plugins
        let l:choice = input("Update vim plugins, [y/n]?\n")
        if l:choice == 'y'
            call dein#update()
            call dein#recache_runtimepath()
        else
            call osv_ultis#msg#info("Skip updating plugins!")
        endif

        call writefile([l:today], l:filename, 'a')
        if has('nvim') && has('python3') && l:choice == 'y' && l:osv_update == 'y'
            execute "UpdateRemotePlugins"
        endif
    endif
endfunction
