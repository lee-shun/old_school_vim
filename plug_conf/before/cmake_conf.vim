let cpus = split(system("echo $(($(nproc) -1))"), "\n")[0]

let g:cmake_compile_commands = 1
let g:cmake_compile_commands_link = '.'
let g:cmake_build_type = 'Debug'
let g:cmake_usr_args = '-D PCM_PRINT_INFO=PCM_DEBUG'
let g:cmake_build_args = '-j $(($(nproc) -1))'
