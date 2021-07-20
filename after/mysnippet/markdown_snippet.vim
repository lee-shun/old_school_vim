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
let g:localvimrc_sandbox = 0

" ===
" === additional functions
" ===
function! Count(pattern,startline)
  let l:matches = []
  silent! exe a:startline . ',.s/' . a:pattern . '/\=add(l:matches, submatch(0))/gn'
  return len(l:matches)
endfunction

autocmd Filetype markdown inoremap <expr> <localLeader><F12> eval(Count('\[\^\d\+\]',1)+1)

function! Findtitle()
    for i in range(line('.'))
        if matchstr(getline(line('.')-i),'^# \+')!=#''
            let l:latesttitleline=line('.')-i
            break
        else
            let l:latesttitleline=line('.')
        endif
    endfor
    return l:latesttitleline
endfunction

autocmd Filetype markdown inoremap <expr> <localLeader><F11> Count('^# \+',1)
autocmd Filetype markdown inoremap <expr> <localLeader><F10> Count(' \\tag{\d\+-\d\+}',Findtitle())+1

" ===
" === for greneral writting
" ===
autocmd Filetype markdown inoremap <localLeader>f <Esc>/<++><CR>:nohlsearch<CR>i<Del><Del><Del><Del>

autocmd FileType markdown inoremap <localLeader>c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd FileType markdown inoremap <localLeader>m - [ ] 
autocmd Filetype markdown inoremap <localLeader>p ![](<C-R>+ "<++>")<++><Esc>F]i
autocmd Filetype markdown inoremap <localLeader>a [](<C-R>+ "<++>")<++><Esc>F]i
autocmd FileType markdown inoremap <localLeader>l --------<Enter>
autocmd Filetype markdown inoremap <localLeader>b ****<++><Esc>F*hi
autocmd Filetype markdown inoremap <localLeader>u <u></u><++><Esc>F/i<Left>
autocmd Filetype markdown inoremap <localLeader>i **<++><Esc>F*i
autocmd Filetype markdown inoremap <localLeader>d ~~~~<++><Esc>F~hi
autocmd Filetype markdown inoremap <localLeader>s ``<++><Esc>F`i
autocmd Filetype markdown inoremap <localLeader>t <br><br><Esc>o> *Last Modified at <C-R>=strftime('%Y-%m-%d %H:%M:%S')<C-M>*<Down><Esc>o<CR>

autocmd Filetype markdown inoremap <localLeader>1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <localLeader>2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <localLeader>3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <localLeader>4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <localLeader>5 #####<Space><Enter><++><Esc>kA

" foot notes
autocmd Filetype markdown imap <localLeader>n [^<localLeader><F12>]<Esc>ya[Go<C-r>": <++><Esc><C-o>f]a


" ===
" === for equations
" ===
autocmd Filetype markdown inoremap <localLeader>e $$<++><Esc>F$i
autocmd Filetype markdown imap <localLeader>q <ESC>o$$<Enter><Enter> \tag{<localLeader><F11>-<localLeader><F10>}$$<Enter><BS><++><Esc>2kA

" for speed up \
autocmd Filetype markdown inoremap \\ \\

" for symbol
 autocmd Filetype markdown inoremap \fr \frac{}{<++>}<++><Esc>0f{a
 autocmd Filetype markdown inoremap \ha \hat{}<++><Esc>0f{a
 autocmd Filetype markdown inoremap \do \dot{}<++><Esc>0f{a
 autocmd Filetype markdown inoremap \dd \ddot{}<++><Esc>0f{a
 autocmd Filetype markdown inoremap \sq \sqrt{}<++><Esc>0f{a
 autocmd Filetype markdown inoremap \ve \vec{}<++><Esc>0f{a
 autocmd Filetype markdown inoremap \ol \overline{}<++><Esc>0f{a
 autocmd Filetype markdown inoremap \wt \widetilde{}<++><Esc>0f{a
 autocmd Filetype markdown inoremap \pr ^{\prime}

 " for environment
 autocmd Filetype markdown inoremap \en \begin{}<Enter><++><Enter>\end{<++>}<Esc>2k0f{a
 autocmd Filetype markdown inoremap \al \begin{aligned}<Enter><Enter>\end{aligned}<Esc>kcc
 autocmd Filetype markdown inoremap \ma \begin{matrix}<Enter><Enter>\end{matrix}<Esc>kcc
