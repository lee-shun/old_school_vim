" Expand or jump
imap <expr> <C-y>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-y>'
smap <expr> <C-y>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-y>'

" Jump forward or backward
imap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-l>'
smap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-l>'
imap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'
smap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'
