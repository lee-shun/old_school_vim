" ===
" === Translate
" ===
let g:translator_default_engines=['google', 'bing', 'haici', 'youdao']

if has('nvim')
    let s:has_popup = exists('*nvim_win_set_config') && has('nvim-0.4.2')
else
    let s:has_popup = exists('*popup_create') && has('patch-8.2.191')
endif

if !s:has_popup
    let g:translator_window_type='preview'
else
    let g:translator_window_type='popup'
endif

nnoremap <leader>s :TranslateW<CR>
vnoremap <leader>s :TranslateW<CR>
