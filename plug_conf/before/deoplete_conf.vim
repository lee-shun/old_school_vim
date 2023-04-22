let g:deoplete#enable_at_startup = 1

if &ft == 'tex' && dein#tap('vimtex') && !dein#is_sourced('vimtex')
    call dein#source('vimtex')
endif
