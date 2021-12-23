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
inoremap <buffer> <localLeader>F <Esc>/<++><CR>N:nohlsearch<CR>i<Del><Del><Del><Del>

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
inoremap <buffer> \$ $$<++><Esc>F$i
inoremap <buffer> <LocalLeader>$ $$<Enter><Enter>$$<Enter><++><Esc>2kA
imap <localLeader>q <ESC>o$$<Enter><Enter> \tag{<localLeader><F11>-<localLeader><F10>}$$<Enter><BS><++><Esc>2kA

" for general environment ==> 'e' for environment
" inoremap <buffer> <LocalLeader>en \begin{}<Enter><++><Enter>\end{<++>}<Esc>2kF{a
inoremap <buffer> <LocalLeader>en \begin{ENV}<Enter><++><Enter>\end{ENV}<Esc>2kV3j:VMSearch ENV<CR>
inoremap <buffer> <LocalLeader>ea \left\{<Enter>\begin{aligned}<Enter><Enter>\end{aligned}<Enter>\right.<Esc>2kA
inoremap <buffer> <LocalLeader>em \left[<Enter>\begin{matrix}<Enter><Enter>\end{matrix}<Enter>\right]<Esc>2kA

" for speed up \
inoremap <buffer> \\ \\

" for symbol
inoremap <buffer> \frac \frac{}{<++>}<++><Esc>F{;a
inoremap <buffer> \hat \hat{}<++><Esc>F{a
inoremap <buffer> \dot \dot{}<++><Esc>F{a
inoremap <buffer> \ddot \ddot{}<++><Esc>F{a
inoremap <buffer> \sqrt \sqrt{}<++><Esc>F{a
inoremap <buffer> \vec \vec{}<++><Esc>F{a
inoremap <buffer> \ovl \overline{}<++><Esc>F{a
inoremap <buffer> \wdt \widetilde{}<++><Esc>F{a
inoremap <buffer> \prm ^{\prime}
inoremap <buffer> \rta \rightarrow
inoremap <buffer> \bds \boldsymbol{}<++><Esc>F{a

" ===
" === toggle todo
" ===

function! ToggleTODO()
    let l:has_todo = match(getline('.'), 'TODO:')
    if l:has_todo != -1
        exec 'norm 0fTd2w'
    else
        exec 'norm 0f*iTODO: '
    endif
endfunction

" ===
" === for paper arrangement
" ===
inoremap <buffer> <LocalLeader>- ## **[](.pdf)**<Enter><Enter>```bibtex<Enter><Enter>```<Enter><Enter>- **Keywords:** <++><Enter>- **Abstract:** <++><Enter>- **Note:** <++><Esc>5ka<Tab>

" ===
" === add the paper name
" ===
function! AddPaperName()
    exec "norm 0f{lyw"
    exec "norm 3k0f[pf(p"
endfunction
