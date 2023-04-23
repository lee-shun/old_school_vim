let g:floaterm_keymap_toggle = '<F12>'

if !g:has_popup
    let g:floaterm_wintype = 'split'
else
    let g:floaterm_wintype = 'float'
endif

command! Ranger :FloatermNew --height=0.6 --width=0.8 --wintype=float ranger
