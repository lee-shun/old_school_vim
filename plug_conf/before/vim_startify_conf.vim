let g:startify_session_dir = $CONF_PATH.'/tmp/session'
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ ]

if has('nvim')
    let s:vim = 'neovim'
else
    let s:vim = 'vim'
endif

let s:total_plugins = len(dein#get())
let footer_string= '🎉 Old school '.s:vim .' loaded ' . s:total_plugins . ' plugins 🎊'

let g:startify_custom_header  = startify#center([
            \"",
            \"",
            \"",
            \"    ███████     █████████  █████   █████",
            \"  ███░░░░░███  ███░░░░░███░░███   ░░███ ",
            \" ███     ░░███░███    ░░░  ░███    ░███ ",
            \"░███      ░███░░█████████  ░███    ░███ ",
            \"░███      ░███ ░░░░░░░░███ ░░███   ███  ",
            \"░░███     ███  ███    ░███  ░░░█████░   ",
            \" ░░░███████░  ░░█████████     ░░███     ",
            \"   ░░░░░░░     ░░░░░░░░░       ░░░      ",
            \"",
            \"",
            \footer_string,
            \])
