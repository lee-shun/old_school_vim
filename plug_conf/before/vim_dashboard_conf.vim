let g:dashboard_default_executive = g:osv_finder
let g:dashboard_session_directory =$CONF_PATH.'/tmp/session'
let g:dashboard_custom_header = [
            \"",
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
            \"",
            \]

if has('nvim')
    let s:vim = 'neovim'
else
    let s:vim = 'vim'
endif

let s:total_plugins = len(dein#get())
let footer_string= '🎉 old school '.s:vim .' loaded ' . s:total_plugins . ' plugins 🎊'
let g:dashboard_custom_footer = [footer_string]

