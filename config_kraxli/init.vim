
" dublicate from config/vimrc (after autoload/etc/util has been deleted)
function! s:source_file(path, ...)
	" Source user configuration files with set/global sensitivity
	let use_global = get(a:000, 0, ! has('vim_starting'))
	let abspath = resolve($VIM_PATH . '/' . a:path)
	if ! use_global
		execute 'source' fnameescape(abspath)
		return
	endif

	let tempfile = tempname()
	let content = map(readfile(abspath),
		\ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
	try
		call writefile(content, tempfile)
		execute printf('source %s', fnameescape(tempfile))
	finally
		if filereadable(tempfile)
			call delete(tempfile)
		endif
	endtry
endfunction


if filereadable($VIM_PATH.'/config_local/local_exante_load.vim')
	call s:source_file('config_local/local_exante_load.vim')
endif

let g:config_plugins_dir = $VIM_PATH.path_sep.'config_kraxli'.path_sep.'plugins'

for file in split(globpath(g:config_plugins_dir, '*.vim'), '\n')
   execute 'source' file
endfor


call s:source_file('config_kraxli/settings.vim')
call s:source_file('config_kraxli/mappings.vim')
call s:source_file('config_kraxli/commands.vim')
call s:source_file('config_kraxli/git.vim')
call s:source_file('config_kraxli/filetypesettings.vim')

" load local config / setting files
if exists('g:local_source_dir') && isdirectory(g:local_source_dir)
   for file in split(globpath(g:local_source_dir, '*.vim'), '\n')
      execute 'source' file
   endfor
endif

if filereadable($VIM_PATH.'/config_local/local_expost_load.vim')
	call s:source_file('config_local/local_expost_load.vim')
endif
