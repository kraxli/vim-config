

" === your local settings ===
if has('unix')
	let g:python_host_prog = '/usr/bin/python'
	let g:python3_host_prog = '/usr/bin/python3'
	" let g:python3_host_prog = '/~/.pyenv/versions/python364/bin/python'

	"" To disable Python 2 support:
	" let g:loaded_python_provider = 1
else
endif

" your directory with your local .vim-files to load
let g:local_source_dir='~/Dropbox/ActiveHome/config/nvim/'

" environment related variables
if has('unix')
	let g:environment='home'
else
	let g:environment='work'
end


" === Kraxli ===:
let g:path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/')
let g:nvim_dir = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.path_sep.'?')  " see :h filename-modifiers

" === Rafi ===:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'
