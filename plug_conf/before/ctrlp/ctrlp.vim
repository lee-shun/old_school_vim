let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cache_dir = $CONF_PATH.'/tmp/ctrlp_cache'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp\|dein$',
            \ 'file': '\.so$\|\.dat$|\.DS_Store$'
            \ }
let g:ctrlp_extensions = ['autoignore', 'funky', 'location_list', 'cmdline', 'yankring', 'menu', 'register', 'ag']
