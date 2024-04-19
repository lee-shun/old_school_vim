" ===
" === check the finder
" ===
if g:osv_finder == 'coc-lists'
    if g:osv_complete_engine != 'coc'
        call osv_ultis#msg#err("coc-lists needs the coc.nvim to be used as completion engine. Skip!")
        let g:osv_finder = 'none'
    endif
elseif g:osv_finder == 'fzf'
    if !executable('ag')
        call osv_ultis#msg#warn("fzf.vim needs the silver searcher (ag) to run !")
    endif
    if !executable('rg')
        call osv_ultis#msg#warn("fzf.vim needs the ripgrep (rg) to run!")
    endif
    if !executable('batcat')
        call osv_ultis#msg#warn("fzf.vim need bat(cat) to run the syntax highlight preview in fzf.vim!")
    endif
elseif g:osv_finder == 'ctrlp'
    if v:version < 700 && !has('nvim')
        call osv_ultis#msg#err("ctrlp needs nvim or vim >= 7.0. Skip!")
        let g:osv_finder = 'none'
    endif
    if !executable('ag')
        call osv_ultis#msg#warn("ctrlp needs the silver searcher (ag) to run!")
    endif
elseif g:osv_finder == 'leaderf'
    if !has('patch-7.4.1126') && !has('nvim')
        call osv_ultis#msg#err("leaderf needs nvim or vim >= 7.4.1126. Skip!")
        let g:osv_finder = 'none'
    endif
    if !has('python3')
        call osv_ultis#msg#err("leaderf needs python3. Skip!")
        let g:osv_finder = 'none'
    endif
    if !executable('rg')
        call osv_ultis#msg#warn("leaderf needs the ripgrep (rg)!")
    endif
elseif g:osv_finder == 'clap'
    if g:os_architect == 'aarch64'
        call osv_ultis#msg#err("do NOT use clap under aarch64. Skip!")
        let g:osv_finder = 'none'
    endif
    if !has('patch-8.1.2114') && !has('nvim-0.4.2')
        call osv_ultis#msg#err("ctrlp needs nvim >= 0.4.2 or vim >= 8.1.2114. Skip!")
        let g:osv_finder = 'none'
    endif
    if !executable('rg')
        call osv_ultis#msg#warn("clap needs the ripgrep (rg)!")
    endif
elseif g:osv_finder == 'fuzzyy'
    if !has('patch-9.0.0000')
        call osv_ultis#msg#err("fuzzyy needs vim >= 9.0. Skip!")
        let g:osv_finder = 'none'
    endif
    if !executable('ag') &&  !executable('rg') && !executable('grep')
        call osv_ultis#msg#warn("fuzzyy needs the ripgrep (rg), or the silver searcher(ag) or grep!")
    endif
endif

" ===
" === check the snip
" ===
if g:osv_snip == 'ultisnips'
    if (has('nvim') || v:version >= 800) && has('python3')
    else
        call osv_ultis#msg#warn("ultisnips needs nvim or vim > 8.0 with python3")
        let g:osv_snip = 'none'
    endif
elseif g:osv_snip == 'coc'
    if g:osv_complete_engine != 'coc'
        call osv_ultis#msg#warn("coc-sinpet needs the coc.nvim to be used as completion engine. Skip!")
        let g:osv_snip = 'none'
    endif
elseif g:osv_snip == 'vsnip'
    if !has('patch-8.0.1567') && !has('nvim-0.4.4')
        call osv_ultis#msg#warn("vsnip needs nvim >= 0.4.4 or vim >= 8.0.1567. Skip!")
        let g:osv_snip = 'none'
    endif
endif

if g:osv_complete_engine == 'coc'
    if g:osv_snip != 'none' && g:osv_snip != 'coc'
        call osv_ultis#msg#warn("when use coc.nvim, coc-snipet is recommend. OR there is no any sinpet in the popup menu! Skip!")
        let g:osv_snip = 'none'
    endif
endif

" ===
" === check the file explorer
" ===
if g:osv_file_explorer == 'coc-explorer'
    if g:osv_complete_engine != 'coc'
        call osv_ultis#msg#warn("coc-explorer needs the coc.nvim to be used as completion engine. Skip!")
        let g:osv_file_explorer = 'none'
    endif
elseif g:osv_file_explorer == 'defx'
    if has('nvim-0.4') || v:version > 802 " according to the repo
        " defx.nvim is ok
    else
        call osv_ultis#msg#err("defx.nvim needs nvim >= 0.4 or vim >= 8.2. Skip!")
        let g:osv_file_explorer = 'none'
    endif
elseif g:osv_file_explorer == 'fern'
    if has('nvim') || has('patch-8.1.2269') " according to the repo
        " fern.vim is ok
    else
        call osv_ultis#msg#err("fern.vim needs nvim or vim >= 8.1.2269. Skip!")
        let g:osv_file_explorer = 'none'
    endif
elseif g:osv_file_explorer == 'vimfiler'
    " vimfiler is ok
endif

" ===
" === check the complete engine
" ===
if g:osv_complete_engine == 'coc'
    " don't use coc under aarch64
    if !executable('npm')
        call osv_ultis#msg#err("please install nodejs to use coc. Skip!")
        let g:osv_complete_engine = 'none'
    endif
    " don't use coc with vim under version 8.1-1719
    if !has('nvim-0.4') && !has('patch-8.1.1719')
        call osv_ultis#msg#err("coc.nvim needs vim>=8.1.1719 or nvim>=0.4! Skip!")
        let g:osv_complete_engine = 'none'
    endif
    if g:osv_lsp != 'none'
        call osv_ultis#msg#warn("coc.nvim already has the lsp support! No need to install lsp backend!")
        let g:osv_lsp = 'none'
    endif
elseif g:osv_complete_engine == 'deoplete'
    if !has('python3')
        call osv_ultis#msg#err("deoplete.nvim needs python3 support! Skip!")
        let g:osv_complete_engine = 'none'
    endif
    " NOTE: osv will use different tags according to repo.
    if !has('nvim-0.3') && v:version < 800
        call osv_ultis#msg#err("deoplete.nvim needs vim>=8 or nvim>=0.3! Skip!")
        let g:osv_complete_engine = 'none'
    endif
    if !has('timers')
        call osv_ultis#msg#err("deoplete.nvim needs 'timers' feature! Skip!")
        let g:osv_complete_engine = 'none'
    endif
elseif g:osv_complete_engine == 'asyncomplete'
    " don't use asyncomplete with vim under version 8 or nvim
    if !has('nvim') && v:version < 800
        call osv_ultis#msg#err("asyncomplete.nvim needs vim>=8.0 or nvim! Skip!")
        let g:osv_complete_engine = 'none'
    endif
    if !has('timers')
        call osv_ultis#msg#err("asyncomplete.nvim needs should has 'timers' feature! Skip!")
        let g:osv_complete_engine = 'none'
    endif
elseif g:osv_complete_engine == 'mucomplete'
    " don't use  with vim under version 7.4 or nvim
    if !has('nvim') && v:version < 704
        call osv_ultis#msg#err("mucomplete needs vim>=7.4 or nvim! Skip!")
        let g:osv_complete_engine = 'none'
    endif
    if v:version < 800
        call osv_ultis#msg#warn("update vim to nvim or vim > 8.0 to support mucomplete better!")
    endif
elseif g:osv_complete_engine == 'vimcomplete'
    if v:version <900
        call osv_ultis#msg#err("vimcomplete needs vim>=9.0! Skip!")
        let g:osv_complete_engine = 'none'
    endif
    if g:osv_lsp != 'none' && g:osv_lsp != 'vim9lsp'
        call osv_ultis#msg#err("vimcomplete only supports the vim9lsp as the lsp backend! Skip!")
        let g:osv_lsp = 'none'
        let g:osv_complete_engine = 'none'
    endif
endif

" ===
" === check the linter
" ===
" don't use ale with vim under version 8.0
if !has('nvim-0.2.0') && v:version < 800 && g:osv_linter == 'ale'
    call osv_ultis#msg#err("ale needs vim>=8.0 or nvim! Skip!")
    let g:osv_linter = 'none'
endif

" ===
" === check the lsp
" ===
if g:osv_lsp == 'vim-lsp'
    " don't use lsp with vim under version 8.0
    if !has('nvim') && v:version < 800
        call osv_ultis#msg#err("vim-lsp needs vim>=8.0 or nvim! Skip!")
        let g:osv_lsp = 'none'
    endif
elseif g:osv_lsp == 'lcn'
    " don't use lcn with vim under version 8.0
    if !has('nvim') && v:version < 800
        call osv_ultis#msg#err("LanguageClient-neovim needs vim>=8.0 or nvim! Skip!")
        let g:osv_lsp = 'none'
    endif
elseif g:osv_lsp == 'vim-lsc'
    if !has('nvim') && v:version < 800
        call osv_ultis#msg#err("vim-lsc needs vim>=8.0 or nvim! Skip!")
        let g:osv_lsp = 'none'
    endif
elseif g:osv_lsp == 'vim9lsp'
    if !has('patch-9.0.0000')
        call osv_ultis#msg#err("vim9 lsp only supports vim >= 9.0! Skip!")
        let g:osv_lsp = 'none'
    endif
    if g:osv_complete_engine != 'none' && g:osv_complete_engine != 'vimcomplete'
        call osv_ultis#msg#err("vim9 lsp only supports vimcomplete as the complete engine! Skip!")
        let g:osv_lsp = 'none'
        let g:osv_complete_engine = 'none'
    endif
endif

" ===
" === check the ai
" ===
if (g:os_name == 'Linux') || (g:os_name == 'Windows')
    " check the codeium
    if g:osv_ai == 'codeium' && !has('nvim-0.6') && !has('patch-9.0.0185')
        call osv_ultis#msg#warn("codeium preview needs vim >=9.0.0185 or nvim >= 0.6! Skip!")
        let g:osv_ai = 'none'
    endif
else
    call osv_ultis#msg#warn("only Linux, Windows support ai! Skip!")
    let g:osv_ai = 'none'
endif

