"""HTML
let maplocalleader=';'

inoremap <buffer> <localLeader>f <Esc>/<++><CR>:nohlsearch<CR>i<Del><Del><Del><Del>
inoremap <buffer> <LocalLeader>b <b></b><Space><++><Esc>FbT>i
inoremap <buffer> <LocalLeader>it <em></em><Space><++><Esc>FeT>i
inoremap <buffer> <LocalLeader>1 <h1></h1><Enter><Enter><++><Esc>2kf<i
inoremap <buffer> <LocalLeader>2 <h2></h2><Enter><Enter><++><Esc>2kf<i
inoremap <buffer> <LocalLeader>3 <h3></h3><Enter><Enter><++><Esc>2kf<i
inoremap <buffer> <LocalLeader>p <p></p><Enter><Enter><++><Esc>02kf>a
inoremap <buffer> <LocalLeader>a <a<Space>href=""><++></a><Space><++><Esc>14hi
inoremap <buffer> <LocalLeader>e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
inoremap <buffer> <LocalLeader>ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
inoremap <buffer> <LocalLeader>li <Esc>o<li></li><Esc>F>a
inoremap <buffer> <LocalLeader>ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
inoremap <buffer> <LocalLeader>im <img src="" alt="<++>"><++><esc>Fcf"a
inoremap <buffer> <LocalLeader>td <td></td><++><Esc>Fdcit
inoremap <buffer> <LocalLeader>tr <tr></tr><Enter><++><Esc>kf<i
inoremap <buffer> <LocalLeader>th <th></th><++><Esc>Fhcit
inoremap <buffer> <LocalLeader>tab <table><Enter></table><Esc>O
inoremap <buffer> <LocalLeader>gr <font color="green"></font><Esc>F>a
inoremap <buffer> <LocalLeader>rd <font color="red"></font><Esc>F>a
inoremap <buffer> <LocalLeader>yl <font color="yellow"></font><Esc>F>a
inoremap <buffer> <LocalLeader>dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
inoremap <buffer> <LocalLeader>dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
