" yank bugs
call clap#provider#yanks#init()

" maps
nnoremap <leader>fa :<c-u>Clap<CR>
nnoremap <leader>ff :<c-u>Clap files<CR>
nnoremap <leader>fb :<c-u>Clap buffers<CR>
nnoremap <leader>fo :<c-u>Clap history<CR>
nnoremap <leader>fm :<c-u>Clap history<CR>
nnoremap <leader>fl :<c-u>Clap blines<CR>
nnoremap <leader>fq :<c-u>Clap loclist<CR>
nnoremap <leader>fQ :<c-u>Clap quickfix<CR>
nnoremap <leader>fw :<c-u>Clap grep<CR>
nnoremap <leader>fy :<c-u>Clap yanks<CR>
nnoremap <leader>fr :<c-u>Clap registers<CR>
