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

" ===
" === for greneral writting
" ===
inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
inoremap ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
inoremap ,n ---<Enter><Enter>
inoremap ,b **** <++><Esc>F*hi
inoremap ,s ~~~~ <++><Esc>F~hi
inoremap ,i ** <++><Esc>F*i
inoremap ,d `` <++><Esc>F`i
inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
inoremap ,m - [ ] 
inoremap ,p ![](<++>) <++><Esc>F[a
inoremap ,a [](<++>) <++><Esc>F[a
inoremap ,1 #<Space><Enter><++><Esc>kA
inoremap ,2 ##<Space><Enter><++><Esc>kA
inoremap ,3 ###<Space><Enter><++><Esc>kA
inoremap ,4 ####<Space><Enter><++><Esc>kA
inoremap ,l --------<Enter>

" ===
" === for equations
" ===
inoremap ,e $$<++><Esc>F$i

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
