" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
            \'cpp':['ccls'],
            \'cmake':['cmake-language-server'],
            \'tex':['texlab'],
            \'python': ['/usr/local/bin/pyls'],
            \'vim':['vim-language-server', '--stdio'],
            \}
