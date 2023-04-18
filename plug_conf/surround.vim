let g:surround_no_mappings = 1

nmap sd  <Plug>Dsurround
nmap sr  <Plug>Csurround
nmap Sr  <Plug>CSurround
nmap sa  <Plug>Ysurround
nmap Sa  <Plug>YSurround
" line-wise add
nmap ssa  <Plug>Yssurround
" line-wise indent add
nmap Ssa  <Plug>YSsurround

xmap sa  <Plug>VSurround
" visual indent
xmap Ssa  <Plug>VgSurround
