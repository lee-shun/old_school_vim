" ===
" === basic
" ===
if g:has_popup
    let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.9 } }
else
    if has('nvim') || has('gui_running')
        let $FZF_DEFAULT_OPTS .= ' --inline-info'
    endif

    if !has('nvim')
        " Make all FZF commands to use fullscreen layout in VIM
        let g:fzf_layout = {}
    endif
endif

let s:fzf_preview_key    = get(g:, 'fzf_preview_key', 'ctrl-/')
let g:fzf_preview_window = ['up:50%', s:fzf_preview_key]


