" TODO: need to figure out the nvim python bug
call wilder#setup({'modes': [':', '/', '?']})

if has('python')
    " For Neovim or Vim with yarp
    " For wild#cmdline_pipeline():
    "   'language'   : set to 'python' to use python
    "   'fuzzy'      : 0 - turns off fuzzy matching
    "                : 1 - turns on fuzzy matching
    "                : 2 - partial fuzzy matching (match does not have to begin with the same first letter)
    " For wild#python_search_pipeline():
    "   'pattern'    : can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
    "   'sorter'     : omit to get results in the order they appear in the buffer
    "   'engine'     : can be set to 're2' for performance, requires pyre2 to be installed
    "                : see :h wilder#python_search() for more details
    call wilder#set_option('pipeline', [
                \   wilder#branch(
                \     wilder#cmdline_pipeline({
                \       'language': 'python',
                \       'fuzzy': 1,
                \     }),
                \     wilder#python_search_pipeline({
                \       'pattern': wilder#python_fuzzy_pattern(),
                \       'sorter': wilder#python_difflib_sorter(),
                \       'engine': 're',
                \     }),
                \   ),
                \ ])
endif

if g:has_popup_win
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
