" ===
" === markdown
" ===
" NOTE: use the plasticboy markdown sytanx file
let g:vim_markdown_math=1
let g:vim_markdown_conceal=1
let g:closetag_html_style=1

" ===
" === markdown_preview.nvim
" ===
if g:os_name == 'Linux' && executable('google-chrome')
    function! g:Open_browser(url)
        if executable("microsoft-edge-dev")
            let l:browser= "microsoft-edge-dev"
        elseif executable("microsoft-edge")
            let l:browser= "microsoft-edge"
        elseif executable("google-chrome")
            let l:browser= "google-chrome"
        else
            echo "need edge or chrome to be installed."
            return
        endif

        silent exec "!" . l:browser . " --password-store=gnome --new-window " . a:url . " &"
    endfunction
    let g:mkdp_browserfunc = 'g:Open_browser'
endif

