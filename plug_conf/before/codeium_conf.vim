let g:codeium_disable_bindings = 1

imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <A-]>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <A-[>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>
