call deoplete#custom#option({
            \ 'auto_complete_delay': 10,
            \ 'smart_case': v:true,
            \ })
" for latex
if(exists('g:loaded_vimtex'))
    call deoplete#custom#var('omni', 'input_patterns', {
                \ 'tex': g:vimtex#re#deoplete
                \})
endif
