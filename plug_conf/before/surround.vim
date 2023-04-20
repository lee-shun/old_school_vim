let g:surround_no_mappings = 1

nmap gsd  <Plug>Dsurround
nmap gsr  <Plug>Csurround
nmap gSr  <Plug>CSurround
nmap gsa  <Plug>Ysurround
nmap gSa  <Plug>YSurround
" line-wise add
nmap gssa  <Plug>Yssurround
" line-wise indent add
nmap gSsa  <Plug>YSsurround

xmap gsa  <Plug>VSurround
" visual indent
xmap gSsa  <Plug>VgSurround
