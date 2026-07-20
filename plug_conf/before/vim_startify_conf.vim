let g:startify_session_dir = $CONF_PATH.'/tmp/session'
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ ]

let g:startify_custom_header  = startify#center(
            \ osv_ultis#dashboard#header() + [osv_ultis#dashboard#footer()])
