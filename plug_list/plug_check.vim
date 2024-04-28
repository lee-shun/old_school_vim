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
    if !osv_ultis#check_env#check_vim_ver(700) && !osv_ultis#check_env#check_nvim_ver('nvim')
        call osv_ultis#msg#err("ctrlp needs nvim or vim >= 7.0. Skip!")
        let g:osv_finder = 'none'
    endif
    if !executable('ag')
        call osv_ultis#msg#warn("ctrlp needs the silver searcher (ag) to run!")
    endif
elseif g:osv_finder == 'leaderf'
    if !osv_ultis#check_env#check_vim_patch('patch-7.4.1126') && !osv_ultis#check_env#check_nvim_ver('nvim')
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
    if !osv_ultis#check_env#check_vim_patch('patch-8.1.2114') && !osv_ultis#check_env#check_nvim_ver('nvim-0.4.0')
        call osv_ultis#msg#err("clap needs vim-8.1.2114 or nvim >= 0.4.0. Skip!")
        let g:osv_finder = 'none'
    endif
    if !executable('rg')
        call osv_ultis#msg#warn("clap needs the ripgrep (rg)!")
    endif
elseif g:osv_finder == 'fuzzyy'
    if !osv_ultis#check_env#check_vim_ver(900)
        call osv_ultis#msg#err("fuzzyy needs vim >= 9.0, no nvim support. Skip!")
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
    if osv_ultis#check_env#check_vim_ver(800) || osv_ultis#check_env#check_nvim_ver('nvim') && has('python3')
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
    if !osv_ultis#check_env#check_vim_patch('patch-8.0.1567') && !osv_ultis#check_env#check_nvim_ver('nvim-0.4.4')
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
    if !osv_ultis#check_env#check_vim_ver(802) && !osv_ultis#check_env#check_nvim_ver('nvim-0.4.0')
        call osv_ultis#msg#err("defx.nvim needs nvim >= 0.4 or vim >= 8.2. Skip!")
        let g:osv_file_explorer = 'none'
    endif
elseif g:osv_file_explorer == 'fern'
    if !osv_ultis#check_env#check_vim_patch('patch-8.1.2269') && !osv_ultis#check_env#check_nvim_ver('nvim')
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
    if !osv_ultis#check_env#check_vim_patch('patch-8.1.1719') && !osv_ultis#check_env#check_nvim_ver('nvim-0.4.0')
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
    if !osv_ultis#check_env#check_vim_ver(800) && !osv_ultis#check_env#check_nvim_ver('nvim-0.3')
        call osv_ultis#msg#err("deoplete.nvim needs vim>=8 or nvim>=0.3! Skip!")
        let g:osv_complete_engine = 'none'
    endif
    if !has('timers')
        call osv_ultis#msg#err("deoplete.nvim needs 'timers' feature! Skip!")
        let g:osv_complete_engine = 'none'
    endif
elseif g:osv_complete_engine == 'asyncomplete'
    " don't use asyncomplete with vim under version 8 or nvim
    if !osv_ultis#check_env#check_vim_ver(800) && !osv_ultis#check_env#check_nvim_ver('nvim')
        call osv_ultis#msg#err("asyncomplete.nvim needs vim>=8.0 or nvim! Skip!")
        let g:osv_complete_engine = 'none'
    endif
    if !has('timers')
        call osv_ultis#msg#err("asyncomplete.nvim needs should has 'timers' feature! Skip!")
        let g:osv_complete_engine = 'none'
    endif
elseif g:osv_complete_engine == 'mucomplete'
    " don't use  with vim under version 7.4 or nvim
    if !osv_ultis#check_env#check_vim_ver(704) && !osv_ultis#check_env#check_nvim_ver('nvim')
        call osv_ultis#msg#err("mucomplete needs vim>=7.4 or nvim! Skip!")
        let g:osv_complete_engine = 'none'
    endif
    if !osv_ultis#check_env#check_vim_ver(800) && !osv_ultis#check_env#check_nvim_ver('nvim')
        call osv_ultis#msg#warn("update vim to nvim or vim > 8.0 to support mucomplete better!")
    endif
elseif g:osv_complete_engine == 'vimcomplete'
    if !osv_ultis#check_env#check_vim_ver(900)
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
if  g:osv_linter == 'ale' && !osv_ultis#check_env#check_vim_ver(800) && !osv_ultis#check_env#check_nvim_ver('nvim-0.2.0')
    call osv_ultis#msg#err("ale needs vim>=8.0 or nvim! Skip!")
    let g:osv_linter = 'none'
endif

" ===
" === check the lsp
" ===
if g:osv_lsp == 'vim-lsp'
    " don't use lsp with vim under version 8.0
    if !osv_ultis#check_env#check_vim_ver(800) && !osv_ultis#check_env#check_nvim_ver('nvim')
        call osv_ultis#msg#err("vim-lsp needs vim>=8.0 or nvim! Skip!")
        let g:osv_lsp = 'none'
    endif
elseif g:osv_lsp == 'lcn'
    " don't use lcn with vim under version 8.0
    if !osv_ultis#check_env#check_vim_ver(800) && !osv_ultis#check_env#check_nvim_ver('nvim')
        call osv_ultis#msg#err("LanguageClient-neovim needs vim>=8.0 or nvim! Skip!")
        let g:osv_lsp = 'none'
    endif
elseif g:osv_lsp == 'vim-lsc'
    if !osv_ultis#check_env#check_vim_ver(800) && !osv_ultis#check_env#check_nvim_ver('nvim')
        call osv_ultis#msg#err("vim-lsc needs vim>=8.0 or nvim! Skip!")
        let g:osv_lsp = 'none'
    endif
elseif g:osv_lsp == 'vim9lsp'
    if !osv_ultis#check_env#check_vim_ver(900)
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
    if g:osv_ai == 'codeium' &&
                \ !osv_ultis#check_env#check_vim_patch('patch-9.0.0185') &&
                \ ! osv_ultis#check_env#check_nvim_ver('nvim-0.6.0')
        call osv_ultis#msg#warn("codeium preview needs vim >=9.0.0185 or nvim >= 0.6! Skip!")
        let g:osv_ai = 'none'
    endif
else
    call osv_ultis#msg#warn("only Linux, Windows support ai! Skip!")
    let g:osv_ai = 'none'
endif
