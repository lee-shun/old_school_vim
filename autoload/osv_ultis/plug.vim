function! osv_ultis#plug#add(repo, ...) abort
  if g:osv_repo_source ==# 'mirror'
    let repo = 'old_school_vim/' . substitute(a:repo, '^[^/]*/', '', '')
  else
    let repo = a:repo
  endif
  return call('dein#add', [repo] + a:000)
endfunction

function! osv_ultis#plug#lsp_map(mappings) abort
  for [key, plug] in items(a:mappings)
    execute 'nmap <buffer> <silent> ' . key . ' ' . plug
  endfor
endfunction
