" ===
" === Fern.vim
" ===
let g:fern#drawer_width = 30
let g:fern#default_hidden = 1
let g:fern#disable_drawer_smart_quit = 1
let g:fern_renderer_devicons_disable_warning = 1
let g:fern#disable_default_mappings = 1

nnoremap <silent> <leader>t :Fern . -drawer -toggle <CR>

function! s:init_fern() abort
    call fern_git_status#init()
    setlocal  nonumber norelativenumber
    nmap <buffer> h <Plug>(fern-action-collapse)
    nmap <buffer> l <Plug>(fern-action-open-or-expand)
    nmap <buffer> J <Plug>(fern-action-mark)j
    nmap <buffer> K <Plug>(fern-action-mark)k
    nmap <buffer> mt <Plug>(fern-action-mark)
    nmap <buffer> mc <Plug>(fern-action-mark:clear)
    nmap <buffer> <CR> <Plug>(fern-action-open-or-enter)
    nmap <buffer> <BS> <Plug>(fern-action-leave)
    nmap <buffer> <tab> <Plug>(fern-action-choice)
    nmap <buffer> e <Plug>(fern-action-open:split)
    nmap <buffer> v <Plug>(fern-action-open:vsplit)
    nmap <buffer> t <Plug>(fern-action-open:tabedit)
    nmap <buffer> yy <Plug>(fern-action-clipboard-copy)
    nmap <buffer> yp <Plug>(fern-action-yank:path)
    nmap <buffer> yn <Plug>(fern-action-yank:bufname)
    nmap <buffer> dd <Plug>(fern-action-clipboard-move)
    nmap <buffer> p <Plug>(fern-action-clipboard-paste)
    nmap <buffer> df <Plug>(fern-action-trash)
    nmap <buffer> dF <Plug>(fern-action-remove)
    nmap <buffer> a <Plug>(fern-action-new-file)
    nmap <buffer> A <Plug>(fern-action-new-dir)
    nmap <buffer> rn <Plug>(fern-action-rename)
    nmap <buffer> fs <Plug>(fern-action-include)
    nmap <buffer> <C-r> <Plug>(fern-action-reload:all)
    nmap <buffer> <C-h> <Plug>(fern-action-hidden:toggle)
    nmap <buffer> xs <Plug>(fern-action-open:system)
    nmap <buffer> xv <Plug>(fern-action-ex)
endfunction

augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
augroup END

let g:fern#renderer = "nerdfont"
