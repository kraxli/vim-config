

let g:path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/')
" :gs?pat?sub?:  Substitute all occurrences of "pat" with "sub".
let g:nvim_dir = fnamemodify(expand('<sfile>'), ':p:h:h:gs?\\?'.path_sep.'?')
let g:config_plugins_dir = g:nvim_dir.path_sep.'config_kraxli'.path_sep.'plugins'

for file in split(globpath(g:config_plugins_dir, '*.vim'), '\n')
   execute 'source' file
endfor

call etc#util#source_file('config_kraxli/settings.vim')
call etc#util#source_file('config_kraxli/mappings.vim')
call etc#util#source_file('config_kraxli/commands.vim')
call etc#util#source_file('config_kraxli/git.vim')



