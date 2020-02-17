" your directory with your local .vim-files to load
let g:local_source_dir = '/home/dave/Dropbox/ActiveHome/.config/nvim/local/'

" === Kraxli ===:
let g:path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/')
let g:nvim_dir = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.g:path_sep.'?')  " see :h filename-modifiers  /  use $VIM_PATH

" load you local settings
if filereadable(g:local_source_dir . 'init.vim')
	execute 'source ' . g:local_source_dir . 'init.vim'
endif

" === your local settings ===
if !exists('g:python_host_prog')
	let g:python_host_prog = '/usr/bin/python'
endif

if !exists('g:python3_host_prog')
	" let g:loaded_python_provider = 1 " To disable Python 2 support:
	if has('unix')
		let g:python3_host_prog = '/usr/bin/python3'
	else
		let g:python3_host_prog = 'C:/ProgramData/Anaconda3-5.2.0/python.exe'
		" let g:python3_host_prog = '/~/.pyenv/versions/python364/bin/python'
	endif
endif


" === Rafi ===:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

