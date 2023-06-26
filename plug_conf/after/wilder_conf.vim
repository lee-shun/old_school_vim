call wilder#setup({'modes': [':', '/', '?']})

if has('python')
    call wilder#set_option('pipeline', [
                \   wilder#branch(
                \     wilder#cmdline_pipeline({
                \       'fuzzy': 1,
                \       'set_pcre2_pattern': 1,
                \     }),
                \     wilder#python_search_pipeline({
                \       'pattern': 'fuzzy',
                \     }),
                \   ),
                \ ])
endif

if  g:has_popup == 1
    let s:highlighters = [
                \ wilder#pcre2_highlighter(),
                \ wilder#basic_highlighter(),
                \ ]

    call wilder#set_option('renderer', wilder#renderer_mux({
                \ ':': wilder#popupmenu_renderer({
                \   'highlighter': s:highlighters,
                \   'left': [
                \   ' ', wilder#popupmenu_devicons(),
                \   ],
                \   'right': [
                \   ' ', wilder#popupmenu_scrollbar(),
                \ ],
                \ }),
                \ '/': wilder#popupmenu_renderer({
                \   'highlighter': s:highlighters,
                \ }),
                \ }))
endif
