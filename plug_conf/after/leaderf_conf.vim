noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <leader>fw :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
xnoremap <leader>fw :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap <leader>fW :<C-U>Leaderf! rg --recall<CR>

noremap <leader>fq :<C-U><C-R>=printf("Leaderf loclist %s", "")<CR><CR>
noremap <leader>fQ :<C-U><C-R>=printf("Leaderf quickfix %s", "")<CR><CR>
