" hightlight for member functions
hi CocSemProperty ctermfg=LightRed guifg=LightRed  cterm=none gui=none

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use gh to show documentation in preview window.
nnoremap <silent> gh :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Symbol renaming.
nmap <leader>lr <Plug>(coc-rename)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>la  <Plug>(coc-codeaction)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold   :call CocAction('fold',            <f-args>)
command! -nargs=0 OR     :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" coc-clangd
if index(g:coc_global_extensions, 'coc-clangd') >= 0
    augroup CocClangSettings
        autocmd!
        autocmd FileType c,cpp nnoremap <leader>j :CocCommand clangd.switchSourceHeader<cr>
    augroup END
endif

" coc-highlight
if index(g:coc_global_extensions, 'coc-highlight') >= 0
    autocmd CursorHold * silent call CocActionAsync('highlight')
endif

" coc-explorer
if index(g:coc_global_extensions, 'coc-explorer') >= 0
    noremap <leader>t :CocCommand explorer<CR>
endif

" coc-translator
if index(g:coc_global_extensions, 'coc-translator') >= 0
    nmap <leader>s <Plug>(coc-translator-p)
    vmap <leader>s <Plug>(coc-translator-pv)
endif

" coc-snippets
if index(g:coc_global_extensions, 'coc-snippets') >= 0
    call coc#config('snippets', {
                \ 'ultisnips.directories': $CONF_PATH.'/dein/repos/github.com/honza/vim-snippets/UltiSnips/',
                \})
endif

" coc-lists
if index(g:coc_global_extensions, 'coc-lists') >= 0
    nnoremap <silent> <leader>ff :<C-u>CocList files<cr>
    nnoremap <silent> <leader>fc :<C-u>CocList changes<cr>
    nnoremap <silent> <leader>fb :<C-u>CocList buffers<cr>
    nnoremap <silent> <leader>fd :<C-u>CocList diagnostics<cr>
    nnoremap <silent> <leader>fl :<C-u>CocList lines<cr>
    nnoremap <silent> <leader>fm :<C-u>CocList mru<cr>
    nnoremap <silent> <leader>fr :<C-u>CocList registers<cr>
    nnoremap <silent> <leader>fs :<C-u>CocList sessions<cr>
    nnoremap <silent> <leader>fw :<C-u>CocList grep<cr>
    nnoremap <silent> <leader>fq :<C-u>CocList locationlist<cr>
    nnoremap <silent> <leader>fQ :<C-u>CocList quickfix<cr>
    nnoremap <silent> <leader>fa :<C-u>CocList<cr>
    nnoremap <silent> <leader>fp :<C-u>CocListResume<cr>


    if index(g:coc_global_extensions, 'coc-yank') >= 0
        nnoremap <silent> <leader>fy  :<C-u>CocList yank<cr>
    endif

    call coc#config('session', {
                \ 'directory': $CONF_PATH.'/tmp/session',
                \})
endif
