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

inoremap <expr> <localLeader><F12> eval(Count('\[\^\d\+\]',1)+1)

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

inoremap <expr> <localLeader><F11> Count('^## \+',1)
inoremap <expr> <localLeader><F10> Count(' \\tag{\d\+-\d\+}',Findtitle())+1

" ===
" === for greneral writting
" ===
inoremap <localLeader>f <Esc>/<++><CR>:nohlsearch<CR>i<Del><Del><Del><Del>

inoremap <localLeader>c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
inoremap <localLeader>m - [ ] 
inoremap <localLeader>p ![](<C-R>+ "<++>")<++><Esc>F]i
inoremap <localLeader>a [](<C-R>+ "<++>")<++><Esc>F]i
inoremap <localLeader>l --------<Enter>
inoremap <localLeader>b ****<++><Esc>F*hi
inoremap <localLeader>u <u></u><++><Esc>F/i<Left>
inoremap <localLeader>i **<++><Esc>F*i
inoremap <localLeader>d ~~~~<++><Esc>F~hi
inoremap <localLeader>s ``<++><Esc>F`i
inoremap <localLeader>t <br><br><Esc>o> *Last Modified at <C-R>=strftime('%Y-%m-%d %H:%M:%S')<C-M>*<Down><Esc>o<CR>

inoremap <localLeader>1 #<Space><Enter><++><Esc>kA
inoremap <localLeader>2 ##<Space><Enter><++><Esc>kA
inoremap <localLeader>3 ###<Space><Enter><++><Esc>kA
inoremap <localLeader>4 ####<Space><Enter><++><Esc>kA
inoremap <localLeader>5 #####<Space><Enter><++><Esc>kA

" foot notes
imap <localLeader>n [^<localLeader><F12>]<Esc>ya[Go<C-r>": <++><Esc><C-o>f]a


" ===
" === for equations
" ===
inoremap <localLeader>e $$<++><Esc>F$i
imap <localLeader>q <ESC>o$$<Enter><Enter> \tag{<localLeader><F11>-<localLeader><F10>}$$<Enter><BS><++><Esc>2kA

" for speed up \
inoremap \\ \\

" for symbol
inoremap \fr \frac{}{<++>}<++><Esc>0f{a
inoremap \ha \hat{}<++><Esc>0f{a
inoremap \do \dot{}<++><Esc>0f{a
inoremap \dd \ddot{}<++><Esc>0f{a
inoremap \sq \sqrt{}<++><Esc>0f{a
inoremap \ve \vec{}<++><Esc>0f{a
inoremap \ol \overline{}<++><Esc>0f{a
inoremap \wt \widetilde{}<++><Esc>0f{a
inoremap \pr ^{\prime}

" for environment
inoremap \en \begin{}<Enter><++><Enter>\end{<++>}<Esc>2k0f{a
inoremap \al \begin{aligned}<Enter><Enter>\end{aligned}<Esc>kcc
inoremap \ma \begin{matrix}<Enter><Enter>\end{matrix}<Esc>kcc
