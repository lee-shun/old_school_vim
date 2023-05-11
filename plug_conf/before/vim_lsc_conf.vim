let g:lsc_enable_autocomplete = v:true
let g:lsc_auto_map = {
            \ 'GoToDefinition': 'gd',
            \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
            \ 'FindReferences': 'gr',
            \ 'NextReference': '<C-n>',
            \ 'PreviousReference': '<C-p>',
            \ 'FindImplementations': 'gi',
            \ 'FindCodeActions': 'la',
            \ 'Rename': 'lr',
            \ 'ShowHover': v:true,
            \ 'DocumentSymbol': 'go',
            \ 'WorkspaceSymbol': 'gS',
            \ 'SignatureHelp': 'gh',
            \ 'Completion': 'completefunc',
            \}

let g:lsc_server_commands = {
            \ 'cpp': {
            \ 'command': 'clangd --background-index',
            \ 'suppress_stderr': v:true
            \},
            \ 'c': {
            \ 'command': 'clangd --background-index',
            \ 'suppress_stderr': v:true
            \},
            \'python' : 'pyls',
            \}
