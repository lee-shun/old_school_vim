" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <buffer> lm <Plug>(lcn-menu)
" Or map each action separately
nmap <buffer> <silent>gh <Plug>(lcn-hover)
nmap <buffer> <silent>gd <Plug>(lcn-definition)
nmap <buffer> <silent>gr <Plug>(lcn-references)
nmap <buffer> <silent>gi <Plug>(lcn-implementation)

nmap <buffer> <silent>la <Plug>(lcn-code-action)
nmap <buffer> <silent>lr <Plug>(lcn-rename)

nmap <buffer> <silent>]d <Plug>(lcn-diagnostics-next)
nmap <buffer> <silent>[d <Plug>(lcn-diagnostics-prev)
