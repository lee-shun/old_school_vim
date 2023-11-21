" NOTE: if directly use 'set ..', it will be reset by the buildin vimscripts.
augroup format_options_group
    autocmd!
    autocmd BufEnter * setlocal formatoptions+=m formatoptions+=B formatoptions-=o
augroup END

" ===
" === save the cursor line position
" ===
augroup reset_pose_group
    autocmd!
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END


" ===
" === better file type
" ===
augroup extra_filetypes_group
    autocmd!
    autocmd BufNewFile,BufRead *.launch set filetype=xml
    autocmd BufNewFile,BufRead *.Md set filetype=markdown
    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufRead,BufNewFile *.msg set filetype=rosmsg
augroup END


" ===
" === auto setting command
" ===

if exists('##CmdLineEnter')
    augroup dynamic_smartcase_group
        autocmd!
        autocmd CmdLineEnter : set nosmartcase
        autocmd CmdLineLeave : set smartcase
    augroup END
endif

" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight_group
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Display a message when the current file is not in utf-8 format.
" Note that we need to use `unsilent` command here because of this issue:
" https://github.com/vim/vim/issues/4379. For older Vim (version 7.4), the
" help file are in gzip format, do not warn this.
augroup non_utf8_file_warn_group
    autocmd!
    autocmd BufRead * if &fileencoding != 'utf-8' && expand('%:e') != 'gz' && &ft != 'qf'
                \ | unsilent echomsg 'File not in UTF-8 format!' | endif
augroup END

augroup number_toggle_group
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &number | set relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &number | set norelativenumber | endif
augroup END

" new file header
" Do not load when install general plugins
if g:osv_plug_advanced == 0
    augroup file_head_group
        autocmd!
        autocmd BufNewFile *.cxx,*.c,*.cc,*.hpp,*.h,*.cpp,Makefile,CMakeLists.txt,*.sh,*.zsh,*.py call osv_ultis#file_head#set_title()
    augroup END
endif

if g:osv_daily_update == 1
    augroup daily_update_osv_group
        autocmd!
        autocmd VimEnter * call osv_ultis#daily_update#daily_update_osv()
    augroup END
endif
