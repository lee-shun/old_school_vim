"""LATEX
let maplocalleader = ","

inoremap <buffer> <localLeader>f <Esc>/<++><CR>:nohlsearch<CR>i<Del><Del><Del><Del>
inoremap <buffer> <localLeader>eq $$<++><Esc>F$i

" for general environment ==> 'e' for environment
inoremap <buffer> <LocalLeader>en \begin{}<Enter><++><Enter>\end{<++>}<Esc>2k0f{a
inoremap <buffer> <LocalLeader>ea \begin{aligned}<Enter><Enter>\end{aligned}<Esc>kcc
inoremap <buffer> <LocalLeader>em \begin{matrix}<Enter><Enter>\end{matrix}<Esc>kcc
inoremap <buffer> <LocalLeader>eta \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
inoremap <buffer> <LocalLeader>ett \begin{table}<Enter>\caption{<++>}<Enter>\label{<++>}\centering<Enter><++><Enter>\end{tabel}<Enter><Enter><++><Esc>6k0
inoremap <buffer> <LocalLeader>ei \begin{figure}[H]<Enter>\centering<Enter>\includegraphics[width=0.7\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{<++>}<Enter>\end{figure}<Enter><++><Esc>6k0
" for beamer
inoremap <buffer> <LocalLeader>ef \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i

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
inoremap <buffer> \ca \chapter{}<Esc>T{i
inoremap <buffer> \se \section{}<Esc>T{i
inoremap <buffer> \sse \subsection{}<Esc>T{i
inoremap <buffer> \ssse \subsubsection{}<Esc>T{i
inoremap <buffer> \it \item<Space>
inoremap <buffer> \ref \ref{}<Space><++><Esc>T{i
