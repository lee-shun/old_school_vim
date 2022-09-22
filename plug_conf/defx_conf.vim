call defx#custom#column('icon', {
            \ 'directory_icon': '⯈',
            \ 'opened_icon': '⯆',
            \ })

nnoremap <leader>t :Defx -split=vertical -winwidth=35 -direction=topleft -columns=git:indent:icon:icons:filename:type -toggle<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    setlocal norelativenumber
    setlocal nonumber
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> l
                \ defx#is_directory() ?
                \ defx#do_action('open_tree') :
                \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> V
                \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> S
                \ defx#do_action('open', 'split')
    nnoremap <silent><buffer><expr> O
                \ defx#do_action('open_tree', 'recursive')
    nnoremap <silent><buffer><expr> o
                \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> A
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> a
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
                \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns',
                \                'mark:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
                \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yp
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> <BS>
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> J
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('toggle_select') . 'k'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-r>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')
endfunction

