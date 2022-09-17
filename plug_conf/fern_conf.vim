" ===
" === Fern.vim
" ===
let g:fern#drawer_width = 30
let g:fern#default_hidden = 1
let g:fern#disable_drawer_smart_quit = 1
let g:fern_renderer_devicons_disable_warning = 1

noremap <silent> <leader>t :Fern . -drawer -toggle <CR>

function! s:init_fern() abort
    nmap <buffer> S <Plug>(fern-action-open:split)
    nmap <buffer> V <Plug>(fern-action-open:vsplit)
    nmap <buffer> R <Plug>(fern-action-rename)
    nmap <buffer> M <Plug>(fern-action-move)
    nmap <buffer> C <Plug>(fern-action-copy)
    nmap <buffer> P <Plug>(fern-action-new-path)
    nmap <buffer> F <Plug>(fern-action-new-file)
    nmap <buffer> D <Plug>(fern-action-new-dir)
    nmap <buffer> H <Plug>(fern-action-hidden-toggle)
    nmap <buffer> T <Plug>(fern-action-trash)
    nmap <buffer> B <Plug>(fern-action-mark)
endfunction

let g:fern#renderer = "nerdfont"

augroup fern-custom
    autocmd! *
    autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call s:init_fern()
    autocmd FileType fern call s:disable_lightline_on_fern()
    autocmd WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_fern()
augroup END

fu s:disable_lightline_on_fern() abort
    let fern_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'fern') + 1
    call timer_start(0, {-> fern_winnr && setwinvar(fern_winnr, '&stl', '%#Normal#')})
endfu

