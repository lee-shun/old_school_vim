"*******************************************************************************
"                                                                              "
"          .oOOOo.   o      o       .oOOOo.         o                 o        "
"         .O     o. O      O        o     o        O                 O         "
"         O       o o      o        O.             o                 o         "
"         o       O O      o         `OOoo.        O                 O         "
"         O       o o  .oOoO              `O .oOo  OoOo. .oOo. .oOo. o         "
"         o       O O  o   O               o O     o   o O   o O   o O         "
"         `o     O' o  O   o        O.    .O o     o   O o   O o   O o         "
"          `OoooO'  Oo `OoO'o        `oooO'  `OoO' O   o `OoO' `OoO' Oo        "
"                                                                              "
"  Author : lee-shun                                                           "
"                                                                              "
"  Email  : 2015097272@qq.com                                                  "
"                                                                              "
"*******************************************************************************

let g:tmpl_search_paths = [$CONF_PATH.'/template']
let g:tmpl_author_name = 'ShunLi'
let g:tmpl_author_email = '2015097272@qq.com'

" ===
" === fzf
" ===
function GetFname(full_file_name)
    let tmp_name = split(a:full_file_name, "/")[-1]
    let name  = fnamemodify(tmp_name, ":r")
    return name
endfunction
function UseTemplate(full_file_name)
    let name  = GetFname(a:full_file_name)
    execute 'TemplateInit '.name
endfunction

function GetTemplates()
    let templates_path = add(g:tmpl_search_paths, $CONF_PATH."/dein/repos/github.com/tibabit/vim-templates/templates")
    let template_list = []
    for it in templates_path
        let names = readdir(it)
        for name in names
            call add(template_list, it.'/'.name)
        endfor
    endfor
    return template_list
endfunction

function! FzfTemplates()

    let template_list = GetTemplates()
    if(template_list == [])
        call s:warn('Empty templatelist!')
        return
    endif
    call fzf#run(fzf#vim#with_preview(fzf#wrap({
                \ 'source': template_list,
                \ 'column': 1,
                \ 'options': ['--with-nth', '-2..','--delimiter', '/', '--bind', 'alt-a:select-all,alt-d:deselect-all', '--preview-window', '+{2}-/2'],
                \ 'sink': function('UseTemplate')})))
endfunction

command! FzfTemp call FzfTemplates()
