" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
            \'cpp':['ccls'],
            \'python': ['/usr/local/bin/pyls'],
            \}
