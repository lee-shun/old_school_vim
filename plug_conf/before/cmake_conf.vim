let g:cmake_compile_commands = 1
let g:cmake_compile_commands_link = '.'
let g:cmake_build_type = 'Debug'
let g:cmake_usr_args = {"PCM_PRINT_LEVEL":"PCM_DEBUG"}
let g:cmake_build_args = '-j $(($(nproc) -1))'
