

" Kraxli:
if has('unix')
	let g:python_host_prog = '/usr/bin/python'
	let g:python3_host_prog = '/usr/bin/python3'
	" let g:python3_host_prog = '/~/.pyenv/versions/python364/bin/python'

	"" To disable Python 2 support:
	" let g:loaded_python_provider = 1
else
endif


" Rafi:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'
