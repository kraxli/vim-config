

" or simply use $VIM_PATH
let g:config_plugins_dir = g:nvim_dir.path_sep.'config_kraxli'.path_sep.'plugins'

for file in split(globpath(g:config_plugins_dir, '*.vim'), '\n')
   execute 'source' file
endfor


call etc#util#source_file('config_kraxli/settings.vim')
call etc#util#source_file('config_kraxli/mappings.vim')
call etc#util#source_file('config_kraxli/commands.vim')
call etc#util#source_file('config_kraxli/git.vim')

" load local config / setting files
for file in split(globpath(g:local_source_dir, '*.vim'), '\n')
   execute 'source' file
endfor

