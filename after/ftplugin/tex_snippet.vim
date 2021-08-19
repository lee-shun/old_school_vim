"""LATEX
let maplocalleader = ","

inoremap <buffer> <localLeader>f <Esc>/<++><CR>:nohlsearch<CR>i<Del><Del><Del><Del>
inoremap <buffer> <localLeader>eq $$<++><Esc>F$i

" for general environment
inoremap <buffer> <LocalLeader>en \begin{}<Enter><++><Enter>\end{<++>}<Esc>2k0f{a
inoremap <buffer> <LocalLeader>al \begin{aligned}<Enter><Enter>\end{aligned}<Esc>kcc
inoremap <buffer> <LocalLeader>it \begin{itemize}<Enter><Enter>\end{itemize}<Esc>kcc
inoremap <buffer> <LocalLeader>ma \begin{matrix}<Enter><Enter>\end{matrix}<Esc>kcc
inoremap <buffer> <LocalLeader>ta \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
inoremap <buffer> <LocalLeader>tt \begin{table}<Enter>\caption{<++>}<Enter>\label{<++>}\centering<Enter><++><Enter>\end{tabel}<Enter><Enter><++><Esc>6k0
inoremap <buffer> <LocalLeader>pi \begin{figure}[H]<Enter>\centering<Enter>\includegraphics[width=0.7\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{<++>}<Enter>\end{figure}<Enter><++><Esc>6k0
" for beamer
inoremap <buffer> <LocalLeader>ra \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i

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
inoremap <buffer> \ch \chapter{}<Esc>T{i
inoremap <buffer> \se \section{}<Esc>T{i
inoremap <buffer> \sse \subsection{}<Esc>T{i
inoremap <buffer> \ssse \subsubsection{}<Esc>T{i
inoremap <buffer> \it \item<Space>
inoremap <buffer> \ref \ref{}<++><Esc>T{i
inoremap <buffer> \fnt \footnotetext[]{<++>}<++><Esc>T[i
inoremap <buffer> \fnm \footnotemark[]<++><Esc>T[i
inoremap <buffer> \co \colorbox{}{<++>}<++><Esc>0f{i
