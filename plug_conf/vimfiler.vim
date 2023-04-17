let g:vimfiler_as_default_explorer = 1
let g:webdevicons_enable_vimfiler = 1
let g:vimfiler_tree_indentation = 2
let g:vimfiler_tree_leaf_icon = ""
let g:vimfiler_tree_opened_icon = ""
let g:vimfiler_tree_closed_icon = ""
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_ignore_pattern = []

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
          \ 'auto_cd':1,
          \ 'find':0,
          \ })

nnoremap <silent> <leader>t :VimFiler<cr>

let g:vimfiler_no_default_key_mappings = 1

autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings() abort
    setlocal norelativenumber
    setlocal nonumber

    nmap <buffer> j           <Plug>(vimfiler_loop_cursor_down)
    nmap <buffer> k           <Plug>(vimfiler_loop_cursor_up)
    nmap <buffer> gg          <Plug>(vimfiler_cursor_top)
    nmap <buffer> <C-l>           <Plug>(vimfiler_redraw_screen)
    nmap <buffer> J         <Plug>(vimfiler_toggle_mark_current_line)
    nmap <buffer> <S-LeftMouse>       <Plug>(vimfiler_toggle_mark_current_line)
    nmap <buffer> K       <Plug>(vimfiler_toggle_mark_current_line_up)
    nmap <buffer> *           <Plug>(vimfiler_toggle_mark_all_lines)
    nmap <buffer> #           <Plug>(vimfiler_mark_similar_lines)
    nmap <buffer> U           <Plug>(vimfiler_clear_mark_all_lines)
    nmap <buffer> yy           <Plug>(vimfiler_copy_file)
    nmap <buffer> c           <Plug>(vimfiler_move_file)
    nmap <buffer> d           <Plug>(vimfiler_delete_file)
    nmap <buffer> Cc          <Plug>(vimfiler_clipboard_copy_file)
    nmap <buffer> Cm          <Plug>(vimfiler_clipboard_move_file)
    nmap <buffer> Cp          <Plug>(vimfiler_clipboard_paste)
    nmap <buffer> r           <Plug>(vimfiler_rename_file)
    nmap <buffer> A           <Plug>(vimfiler_make_directory)
    nmap <buffer> a           <Plug>(vimfiler_new_file)
    nmap <buffer> <Enter>         <Plug>(vimfiler_cd_or_edit)
    nmap <buffer> o           <Plug>(vimfiler_expand_or_edit)
    nmap <buffer> l           <Plug>(vimfiler_smart_l)
    nmap <buffer> x           <Plug>(vimfiler_execute_system_associated)
    nmap <buffer> X           <Plug>(vimfiler_execute_vimfiler_associated)
    nmap <buffer> h           <Plug>(vimfiler_smart_h)
    nmap <buffer> L           <Plug>(vimfiler_switch_to_drive)
    nmap <buffer> ~           <Plug>(vimfiler_switch_to_home_directory)
    nmap <buffer> \           <Plug>(vimfiler_switch_to_root_directory)
    nmap <buffer> &           <Plug>(vimfiler_switch_to_project_directory)
    nmap <buffer> <C-j>           <Plug>(vimfiler_switch_to_history_directory)
    nmap <buffer> <BS>            <Plug>(vimfiler_switch_to_parent_directory)
    nmap <buffer> .           <Plug>(vimfiler_toggle_visible_ignore_files)
    nmap <buffer> H           <Plug>(vimfiler_popup_shell)
    nmap <buffer> e           <Plug>(vimfiler_edit_file)
    nmap <buffer> E           <Plug>(vimfiler_split_edit_file)
    nmap <buffer> B           <Plug>(vimfiler_edit_binary_file)
    nmap <buffer> ge          <Plug>(vimfiler_execute_external_filer)
    nmap <buffer> <RightMouse>        <Plug>(vimfiler_execute_external_filer)
    nmap <buffer> !           <Plug>(vimfiler_execute_shell_command)
    nmap <buffer> q           <Plug>(vimfiler_hide)
    nmap <buffer> Q           <Plug>(vimfiler_exit)
    nmap <buffer> -           <Plug>(vimfiler_close)
    nmap <buffer> g?          <Plug>(vimfiler_help)
    nmap <buffer> v           <Plug>(vimfiler_preview_file)
    nmap <buffer> O           <Plug>(vimfiler_sync_with_current_vimfiler)
    nmap <buffer> go          <Plug>(vimfiler_open_file_in_another_vimfiler)
    nmap <buffer> <C-g>           <Plug>(vimfiler_print_filename)
    nmap <buffer> g<C-g>          <Plug>(vimfiler_toggle_maximize_window)
    nmap <buffer> yp          <Plug>(vimfiler_yank_full_path)
    nmap <buffer> M           <Plug>(vimfiler_set_current_mask)
    nmap <buffer> gr          <Plug>(vimfiler_grep)
    nmap <buffer> gf          <Plug>(vimfiler_find)
    nmap <buffer> S           <Plug>(vimfiler_select_sort_type)
    nmap <buffer> <C-v>           <Plug>(vimfiler_switch_vim_buffer_mode)
    nmap <buffer> gc          <Plug>(vimfiler_cd_vim_current_dir)
    nmap <buffer> gs          <Plug>(vimfiler_toggle_safe_mode)
    nmap <buffer> gS          <Plug>(vimfiler_toggle_simple_mode)
    nmap <buffer> n           <Plug>(vimfiler_choose_action)
    nmap <buffer> Y           <Plug>(vimfiler_pushd)
    nmap <buffer> P           <Plug>(vimfiler_popd)
    nmap <buffer> t           <Plug>(vimfiler_expand_tree)
    nmap <buffer> T           <Plug>(vimfiler_expand_tree_recursive)
    nmap <buffer> I           <Plug>(vimfiler_cd_input_directory)
    nmap <buffer> <2-LeftMouse>       <Plug>(vimfiler_double_click)
    nmap <buffer> gj          <Plug>(vimfiler_jump_last_child)
    nmap <buffer> gk          <Plug>(vimfiler_jump_first_child)
    vmap <buffer> J         <Plug>(vimfiler_toggle_mark_selected_lines)
endfunction
