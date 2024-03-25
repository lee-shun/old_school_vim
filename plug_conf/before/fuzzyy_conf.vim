" Set to 0 to disable default keybindings
" Default to 1
let g:enable_fuzzyy_keymaps = 0

" Make FuzzyFiles respect .gitignore if set to 1
" only work when
" 1. inside a git repository and git is installed
" 2. or fd is installed
" Default to 0
let g:files_respect_gitignore = 1

" Change navigation keymaps
" The following is the default
let g:fuzzyy_keymaps = {
            \     'menu_up': ["\<c-k>", "\<Up>"],
            \     'menu_down': ["\<c-j>", "\<Down>"],
            \     'menu_select': ["\<CR>"],
            \     'preview_up': ["\<c-k>"],
            \     'preview_down': ["\<c-j>"],
            \     'cursor_begining': ["\<c-a>"],
            \     'cursor_end': ["\<c-e>"],
            \     'delete_all': ["\<c-k>"],
            \    'delete_prefix': [],
            \     'exit': ["\<Esc>", "\<c-c>", "\<c-[>"],
            \ }

" Change highlight of the matched text when searching
" Default to cursearch
let g:fuzzyy_menu_matched_hl = 'cursearch'

" Whether show devicons when using FuzzyFiles or FuzzyBuffers
" Requires vim-devicons
" Default to 1 if vim-devicons is installed, 0 otherwise
let g:fuzzyy_devicons = 1

" Enable dropdown theme
" Default to 0
let g:fuzzyy_dropdown = 1

" Enable FuzzyMRUFiles command.
" If enabled, the MRU list will be recorded into ~/.vim_mru_files in Unix
" and ~/_vim_mru_files in Windows
" Default to 0
let g:enable_fuzzyy_MRU_files = 1

" FuzzyMRUFiles default shows MRU files that are in the current project
" default to 0
let g:fuzzyy_mru_project_only = 0

" window layout configuraton
" you can override it by setting g:fuzzyy_window_layout
" e.g. You can disable preview window for FuzzyFiles command by doing this:
" let g:fuzzyy_window_layout = { 'FuzzyFiles': { 'preview': 0 } }
" default value:
" {
"     'FuzzyFiles': {
"         'preview': 1,         " 1 means enable preview window, 0 means disable
"         'preview_ratio': 0.5, " 0.5 means preview window will take 50% of the layout
"         'width': 0.8,         " 0.8 means total width of the layout will take 80% of the screen
"         },
"     'FuzzyGrep': {
"         'preview': 1,
"         'preview_ratio': 0.5,
"         'width': 0.8,
"         },
"     'FuzzyBuffers': {
"         'preview': 1,
"         'preview_ratio': 0.5,
"         'width': 0.8,
"         },
"     'FuzzyMRUFiles': {
"         'preview': 1,
"         'preview_ratio': 0.5,
"         'width': 0.8,
"         },
"     'FuzzyHighlights': {
"         'preview': 1,
"         'preview_ratio': 0.7,
"         'width': 0.8,
"         },
" }
