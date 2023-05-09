if g:os_name == 'Windows'
    let g:floaterm_shell = 'powershell.exe'
else
    if executable('zsh')
        let g:floaterm_shell = 'zsh'
    elseif executable('bash')
        let g:floaterm_shell = 'bash'
    endif
endif

let g:floaterm_keymap_toggle = '<F12>'

if !g:has_popup
    let g:floaterm_wintype = 'split'
else
    let g:floaterm_wintype = 'float'
endif

command! Ranger :<C-U>FloatermNew --height=0.6 --width=0.8 ranger
