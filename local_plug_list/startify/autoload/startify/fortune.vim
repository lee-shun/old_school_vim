if has('nvim')
    let s:vim = 'neovim'
else
    let s:vim = 'vim'
endif

let s:total_plugins = len(dein#get())
let footer_string= '🎉 old school '.s:vim .' loaded ' . s:total_plugins . ' local plugins 🎊'

let s:log  = [
            \"",
            \"",
            \"",
            \"    ███████     █████████  █████   █████",
            \"  ███░░░░░███  ███░░░░░███░░███   ░░███ ",
            \" ███     ░░███░███    ░░░  ░███    ░███ ",
            \"░███      ░███░░█████████  ░███    ░███ ",
            \"░███      ░███ ░░░░░░░░███ ░░███   ███  ",
            \"░░███     ███  ███    ░███  ░░░█████░   ",
            \" ░░░███████░  ░░█████████     ░░███     ",
            \"   ░░░░░░░     ░░░░░░░░░       ░░░      ",
            \"",
            \"",
            \footer_string,
            \]

function! s:get_random_offset(max) abort
  return str2nr(matchstr(reltimestr(reltime()), '\.\zs\d\+')[1:]) % a:max
endfunction

function! startify#fortune#quote() abort
  return s:quotes[s:get_random_offset(len(s:quotes))]
endfunction

function! startify#fortune#dogesay() abort
  return map(s:log, '"   ". v:val')
endfunction
