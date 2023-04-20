" ===
" === fzf + template
" ===
function! s:warn(message) abort
    echohl WarningMsg
    echomsg a:message
    echohl None
    return 0
endfunction

function s:get_fname(full_file_name) abort
    let tmp_name = split(a:full_file_name, "/")[-1]
    let name  = fnamemodify(tmp_name, ":r")
    return name
endfunction

function s:use_template(full_file_name) abort
    let name  = s:get_fname(a:full_file_name)
    execute 'TemplateInit '.name
endfunction

function s:get_templates() abort
    let templates_path = add(g:tmpl_search_paths, g:tmpl_default_path)
    let template_list = []
    for it in templates_path
        let names = readdir(it)
        for name in names
            call add(template_list, it.'/'.name)
        endfor
    endfor
    return template_list
endfunction

function! s:fzf_templates(bang)
    let template_list = s:get_templates()
    if(template_list == [])
        call s:warn('Empty template list!')
        return
    endif
    call fzf#run(fzf#vim#with_preview(fzf#wrap({
                \ 'source': template_list,
                \ 'column': 1,
                \ 'options': ['--with-nth', '-2..', '--delimiter', '/', '--preview-window', '+{2}-/2', '--prompt', 'Templates>'],
                \ 'sink': function('s:use_template')}, a:bang)))
endfunction

command! -bang Tmpl call s:fzf_templates(<bang>0)

nnoremap <leader>ft :Tmpl<CR>
