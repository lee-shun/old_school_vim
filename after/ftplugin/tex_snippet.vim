"""LATEX
let maplocalleader = ","

inoremap <buffer> <localLeader>f <Esc>/<++><CR>:nohlsearch<CR>i<Del><Del><Del><Del>

" for general environment
inoremap <buffer> <LocalLeader>en \begin{ENV}<Enter><++><Enter>\end{ENV}<Esc>2kV3j:VMSearch ENV<CR>
inoremap <buffer> <LocalLeader>al \begin{aligned}<Enter><Enter>\end{aligned}<Esc>kcc
inoremap <buffer> <LocalLeader>it \begin{itemize}<Enter><Enter>\end{itemize}<Esc>kcc
inoremap <buffer> <LocalLeader>ma \begin{matrix}<Enter><Enter>\end{matrix}<Esc>kcc
inoremap <buffer> <LocalLeader>ta \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
inoremap <buffer> <LocalLeader>tt \begin{table}<Enter>\caption{<++>}<Enter>\label{<++>}\centering<Enter><++><Enter>\end{tabel}<Enter><Enter><++><Esc>6k0
inoremap <buffer> <LocalLeader>pi \begin{figure}[H]<Enter>\centering<Enter>\includegraphics[width=0.7\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{<++>}<Enter>\end{figure}<Enter><++><Esc>6k0
" for beamer
inoremap <buffer> <LocalLeader>ra \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
inoremap <buffer> <LocalLeader>cl \begin{columns}[t]<Enter>\column{\textwidth}<Enter><++><Enter>\end{columns}<Enter><++><Esc>3k0f{a
inoremap <buffer> <LocalLeader>bl \begin{block}{}<Enter><++><Enter>\end{block}<Enter><++><Esc>3k$F{a

" for symbol
inoremap <buffer> \fr \frac{}{<++>}<++><Esc>F};i
inoremap <buffer> \ha \hat{}<++><Esc>0f{a
inoremap <buffer> \do \dot{}<++><Esc>0f{a
inoremap <buffer> \dd \ddot{}<++><Esc>0f{a
inoremap <buffer> \sq \sqrt{}<++><Esc>0f{a
inoremap <buffer> \vec \vec{}<++><Esc>0f{a
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
inoremap <buffer> \cob \colorbox{}{<++>}<++><Esc>0f{a
inoremap <buffer> \tbf \textbf{}<++><Esc>F}i
inoremap <buffer> \tit \textit{}<++><Esc>F}i
inoremap <buffer> \clm \column{\textwidth}<Esc>F\i
inoremap <buffer> \lb \linebreak<Enter>
