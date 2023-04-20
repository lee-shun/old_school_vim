if dein#tap('deoplete.nvim')
    call deoplete#custom#source('omni', {
                \'mark':'[omni]',
                \'max_candidates': 6,
                \})
    call deoplete#custom#var('omni', 'input_patterns', {
                \'tex': g:vimtex#re#deoplete
                \})
endif
