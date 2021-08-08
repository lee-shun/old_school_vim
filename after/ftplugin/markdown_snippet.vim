"**************************************************************************************************
"
"       ___          ___          ___          ___                  ___                   ___
"      /\  \        /\__\        /\  \        /\  \                /\__\        ___      /\__\
"     /::\  \      /:/  /       /::\  \      /::\  \              /:/  /       /\  \    /::|  |
"    /:/\:\  \    /:/  /       /:/\:\  \    /:/\:\  \            /:/  /        \:\  \  /:|:|  |
"   /::\~\:\  \  /:/  /  ___  /::\~\:\  \  /::\~\:\  \          /:/__/  ___    /::\__\/:/|:|__|__
"  /:/\:\ \:\__\/:/__/  /\__\/:/\:\ \:\__\/:/\:\ \:\__\         |:|  | /\__\__/:/\/__/:/ |::::\__\
"  \/__\:\/:/  /\:\  \ /:/  /\/_|::\/:/  /\:\~\:\ \/__/         |:|  |/:/  /\/:/  /  \/__/~~/:/  /
"       \::/  /  \:\  /:/  /    |:|::/  /  \:\ \:\__\           |:|__/:/  /\::/__/         /:/  /
"        \/__/    \:\/:/  /     |:|\/__/    \:\ \/__/            \::::/__/  \:\__\        /:/  /
"                  \::/  /      |:|  |       \:\__\               ~~~~       \/__/       /:/  /
"                   \/__/        \|__|        \/__/                                      \/__/
"
"  Author : lee-shun
"
"  Email  : 2015097272@qq.com
"
"**************************************************************************************************

let maplocalleader = ","

" ===
" === additional functions
" ===
function! Count(pattern,startline)
  let l:matches = []
  silent! exe a:startline . ',.s/' . a:pattern . '/\=add(l:matches, submatch(0))/gn'
  return len(l:matches)
endfunction

inoremap <buffer> <expr> <localLeader><F12> eval(Count('\[\^\d\+\]',1)+1)

function! Findtitle()
  for i in range(line('.'))
    if matchstr(getline(line('.')-i),'^## \+')!=#''
      let l:latesttitleline=line('.')-i
      break
    else
      let l:latesttitleline=line('.')
    endif
  endfor
  return l:latesttitleline
endfunction

inoremap <buffer> <expr> <localLeader><F11> Count('^## \+',1)
inoremap <buffer> <expr> <localLeader><F10> Count(' \\tag{\d\+-\d\+}',Findtitle())+1

" ===
" === for greneral writting
" ===
inoremap <buffer> <localLeader>f <Esc>/<++><CR>:nohlsearch<CR>i<Del><Del><Del><Del>

inoremap <buffer> <localLeader>c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
inoremap <buffer> <localLeader>m - [ ] 
inoremap <buffer> <localLeader>p ![](<++>)<++><Esc>F]i
inoremap <buffer> <localLeader>a [](<++>)<++><Esc>F]i
inoremap <buffer> <localLeader>l --------<Enter>
inoremap <buffer> <localLeader>b ****<++><Esc>F*hi
inoremap <buffer> <localLeader>u <u></u><++><Esc>F/i<Left>
inoremap <buffer> <localLeader>i **<++><Esc>F*i
inoremap <buffer> <localLeader>d ~~~~<++><Esc>F~hi
inoremap <buffer> <localLeader>s ``<++><Esc>F`i
inoremap <buffer> <localLeader>t <br><br><Esc>o> *Last Modified at <C-R>=strftime('%Y-%m-%d %H:%M:%S')<C-M>*<Down><Esc>o<CR>

inoremap <buffer> <localLeader>1 #<Space><Enter><++><Esc>kA
inoremap <buffer> <localLeader>2 ##<Space><Enter><++><Esc>kA
inoremap <buffer> <localLeader>3 ###<Space><Enter><++><Esc>kA
inoremap <buffer> <localLeader>4 ####<Space><Enter><++><Esc>kA
inoremap <buffer> <localLeader>5 #####<Space><Enter><++><Esc>kA

" foot notes
imap <localLeader>n [^<localLeader><F12>]<Esc>ya[Go<C-r>": <++><Esc><C-o>f]a


" ===
" === for equations
" ===
inoremap <buffer> <localLeader>eq $$<++><Esc>F$i
imap <localLeader>q <ESC>o$$<Enter><Enter> \tag{<localLeader><F11>-<localLeader><F10>}$$<Enter><BS><++><Esc>2kA

" for general environment ==> 'e' for environment
inoremap <buffer> <LocalLeader>en \begin{}<Enter><++><Enter>\end{<++>}<Esc>2k0f{a
inoremap <buffer> <LocalLeader>ea \begin{aligned}<Enter><Enter>\end{aligned}<Esc>kcc
inoremap <buffer> <LocalLeader>em \begin{matrix}<Enter><Enter>\end{matrix}<Esc>kcc

" for speed up \
inoremap <buffer> \\ \\

" for symbol
inoremap <buffer> \fr \frac{}{<++>}<++><Esc>0f{a
inoremap <buffer> \ha \hat{}<++><Esc>0f{a
inoremap <buffer> \do \dot{}<++><Esc>0f{a
inoremap <buffer> \dd \ddot{}<++><Esc>0f{a
inoremap <buffer> \sq \sqrt{}<++><Esc>0f{a
inoremap <buffer> \ve \vec{}<++><Esc>0f{a
inoremap <buffer> \ol \overline{}<++><Esc>0f{a
inoremap <buffer> \wt \widetilde{}<++><Esc>0f{a
inoremap <buffer> \pr ^{\prime}
inoremap <buffer> \ra \rightarrow
