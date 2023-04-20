call defx#custom#column('icon', {
            \ 'directory_icon': '',
            \ 'opened_icon': '',
            \ })

nnoremap <silent> <leader>t :Defx -split=vertical -winwidth=35
            \ -direction=topleft -columns=git:indent:icons:filename:type -toggle
            \ -resume -search_recursive=`expand('%:p')` `getcwd()`<CR>
" nnoremap <silent> <leader>t :Defx -split=vertical -winwidth=35
"             \ -direction=topleft -columns=git:indent:icons:filename:type -toggle
"             \ -resume <CR>

autocmd FileType defx call s:defx_custom_keymappings()
function! s:defx_custom_keymappings() abort
    setlocal norelativenumber
    setlocal nonumber
    " Define mappings
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> l
                \ defx#is_directory() ?
                \ defx#do_action('open_tree') :
                \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> J
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('toggle_select') . 'k'
    nnoremap <silent><buffer><expr> L
                \ defx#do_action('open_tree', 'recursive')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> mt
                \ defx#do_action('toggle_select')
    nnoremap <silent><buffer><expr> ma
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> <BS>
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> e
                \ defx#do_action('open', 'split')
    nnoremap <silent><buffer><expr> o
                \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> v
                \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> t
                \ defx#do_action('open', 'tab')
    nnoremap <silent><buffer><expr> ip
                \ defx#do_action('preview')
    nnoremap <silent><buffer><expr> if
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cc
                \ defx#do_action('clear_clipboard')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> yp
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> yn
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> dd
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> df
                \ defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> dF
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> A
                \ defx#do_action('new_directory')
    " file or path with /
    nnoremap <silent><buffer><expr> a
                \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> rn
                \ defx#do_action('rename', "append")
    nnoremap <silent><buffer><expr> rN
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> fs
                \ defx#do_action('change_filtered_files')
    nnoremap <silent><buffer><expr> <C-r>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-h>
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> xv
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> xs
                \ defx#do_action('execute_system')

    " special
    nnoremap <silent><buffer><expr> st
                \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> sn
                \ defx#do_action('toggle_sort', 'filename')
    nnoremap <silent><buffer><expr> ss
                \ defx#do_action('toggle_sort', 'size')
    nnoremap <silent><buffer><expr> se
                \ defx#do_action('toggle_sort', 'extension')
endfunction
