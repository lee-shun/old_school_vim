function! osv_ultis#dashboard#header() abort
    return [
                \ '',
                \ '',
                \ '',
                \ '    ███████     █████████  █████   █████',
                \ '  ███░░░░░███  ███░░░░░███░░███   ░░███ ',
                \ ' ███     ░░███░███    ░░░  ░███    ░███ ',
                \ '░███      ░███░░█████████  ░███    ░███ ',
                \ '░███      ░███ ░░░░░░░░███ ░░███   ███  ',
                \ '░░███     ███  ███    ░███  ░░░█████░   ',
                \ ' ░░░███████░  ░░█████████     ░░███     ',
                \ '   ░░░░░░░     ░░░░░░░░░       ░░░      ',
                \ '',
                \ '',
                \ ]
endfunction

function! osv_ultis#dashboard#footer() abort
    let vim_name = has('nvim') ? 'neovim' : 'vim'
    return '🎉 old school ' . vim_name . ' loaded ' . len(dein#get()) . ' plugins 🎊'
endfunction
