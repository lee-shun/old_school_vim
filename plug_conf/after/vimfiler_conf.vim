call vimfiler#custom#profile('default', 'context', {
            \ 'explorer' : 1,
            \ 'winwidth' : 35,
            \ 'toggle' : 1,
            \ 'columns' : 'devicons',
            \ 'auto_expand': 1,
            \ 'parent': 0,
            \ 'explorer_columns' : 'devicons',
            \ 'status' : 1,
            \ 'safe' : 0,
            \ 'split' : 1,
            \ 'hidden': 1,
            \ 'no_quit' : 1,
            \ 'force_hide' : 0,
            \ 'auto_cd':0,
            \ 'find':0,
            \ })

nnoremap <silent> <leader>t :VimFiler<cr>

autocmd FileType vimfiler call s:vimfiler_my_settings()

function! s:vimfiler_my_settings() abort
    setlocal norelativenumber
    setlocal nonumber

    " normal
    nmap <buffer> j     <Plug>(vimfiler_loop_cursor_down)
    nmap <buffer> k     <Plug>(vimfiler_loop_cursor_up)
    nmap <buffer> l     <Plug>(vimfiler_smart_l)
    nmap <buffer> h     <Plug>(vimfiler_smart_h)
    nmap <buffer> gg    <Plug>(vimfiler_cursor_top)
    nmap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)
    nmap <buffer> J     <Plug>(vimfiler_toggle_mark_current_line)
    nmap <buffer> K     <Plug>(vimfiler_toggle_mark_current_line_up)
    nmap <buffer> L     <Plug>(vimfiler_expand_tree_recursive)
    nmap <buffer> ma     <Plug>(vimfiler_toggle_mark_all_lines)
    nmap <buffer> df    <Plug>(vimfiler_delete_file)
    nmap <buffer> yy    <Plug>(vimfiler_clipboard_copy_file)
    nmap <buffer> dd    <Plug>(vimfiler_clipboard_move_file)
    nmap <buffer> p     <Plug>(vimfiler_clipboard_paste)
    nmap <buffer> r     <Plug>(vimfiler_rename_file)
    nmap <buffer> A     <Plug>(vimfiler_make_directory)
    nmap <buffer> a     <Plug>(vimfiler_new_file)
    nmap <buffer> <CR>  <Plug>(vimfiler_cd_or_edit)
    nmap <buffer> <BS>  <Plug>(vimfiler_switch_to_parent_directory)
    nmap <buffer> <tab> <Plug>(vimfiler_choose_action)
    nmap <buffer> xs     <Plug>(vimfiler_execute_system_associated)
    nmap <buffer> <C-h> <Plug>(vimfiler_toggle_visible_ignore_files)
    nmap <buffer> e     <Plug>(vimfiler_split_edit_file)
    nmap <buffer> q     <Plug>(vimfiler_hide)
    nmap <buffer> ?     <Plug>(vimfiler_help)
    nmap <buffer> ip     <Plug>(vimfiler_preview_file)
    nmap <buffer> yp    <Plug>(vimfiler_yank_full_path)
    nmap <buffer> sc     <Plug>(vimfiler_select_sort_type)

    vmap <buffer> J     <Plug>(vimfiler_toggle_mark_selected_lines)
endfunction

