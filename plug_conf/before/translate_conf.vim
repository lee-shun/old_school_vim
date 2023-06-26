" ===
" === Translate
" ===
let g:translator_default_engines=['google', 'bing', 'haici', 'youdao']

if !g:has_popup_win
    let g:translator_window_type='preview'
else
    let g:translator_window_type='popup'
endif

nnoremap <leader>s :TranslateW<CR>
vnoremap <leader>s :TranslateW<CR>
