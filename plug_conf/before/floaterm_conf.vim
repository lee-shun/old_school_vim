let g:floaterm_keymap_toggle = '<F12>'

" Check if Popup/Floating Win is available
if has('nvim')
    let s:has_popup = exists('*nvim_win_set_config') && has('nvim-0.4.2')
else
    let s:has_popup = exists('*popup_create') && has('patch-8.2.191')
endif

if !s:has_popup
    let g:floaterm_wintype = 'split'
else
    let g:floaterm_wintype = 'float'
endif

command! Ranger :FloatermNew --height=0.6 --width=0.8 --wintype=float ranger
