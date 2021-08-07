"""LATEX
let maplocalleader = ","

autocmd FileType tex inoremap <localLeader>f <Esc>/<++><CR>:nohlsearch<CR>i<Del><Del><Del><Del>
autocmd FileType tex inoremap <localLeader>ie $$<++><Esc>F$i

" for general environment
autocmd FileType tex inoremap <LocalLeader>en \begin{}<Enter><++><Enter>\end{<++>}<Esc>2k0f{a
autocmd FileType tex inoremap <LocalLeader>al \begin{aligned}<Enter><Enter>\end{aligned}<Esc>kcc
autocmd FileType tex inoremap <LocalLeader>ma \begin{matrix}<Enter><Enter>\end{matrix}<Esc>kcc
autocmd FileType tex inoremap <LocalLeader>ta \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap <LocalLeader>tt \begin{table}<Enter>\caption{<++>}<Enter>\label{<++>}\centering<Enter><++><Enter>\end{tabel}<Enter><Enter><++><Esc>6k0
autocmd FileType tex inoremap <LocalLeader>im \begin{figure}[H]<Enter>\centering<Enter>\includegraphics[width=0.7\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\label{<++>}<Enter>\end{figure}<Enter><++><Esc>6k0
" for beamer
autocmd FileType tex inoremap <LocalLeader>bf \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i

" for speed up \
autocmd FileType tex inoremap \\ \\
" for symbol
autocmd FileType tex inoremap \fr \frac{}{<++>}<++><Esc>0f{a
autocmd FileType tex inoremap \ha \hat{}<++><Esc>0f{a
autocmd FileType tex inoremap \do \dot{}<++><Esc>0f{a
autocmd FileType tex inoremap \dd \ddot{}<++><Esc>0f{a
autocmd FileType tex inoremap \sq \sqrt{}<++><Esc>0f{a
autocmd FileType tex inoremap \ve \vec{}<++><Esc>0f{a
autocmd FileType tex inoremap \ol \overline{}<++><Esc>0f{a
autocmd FileType tex inoremap \wt \widetilde{}<++><Esc>0f{a
autocmd FileType tex inoremap \pr ^{\prime}
autocmd FileType tex inoremap \ca \chapter{}<Esc>T{i
autocmd FileType tex inoremap \se \section{}<Esc>T{i
autocmd FileType tex inoremap \sse \subsection{}<Esc>T{i
autocmd FileType tex inoremap \ssse \subsubsection{}<Esc>T{i
autocmd FileType tex inoremap \it \item<Space>
autocmd FileType tex inoremap \ref \ref{}<Space><++><Esc>T{i
