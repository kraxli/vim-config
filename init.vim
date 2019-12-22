
" === Kraxli ===:
let g:path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/')
let g:nvim_dir = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.path_sep.'?')  " see :h filename-modifiers  /  use $VIM_PATH

" === your local settings ===
if has('unix')
	let g:python_host_prog = '/usr/bin/python'
	let g:python3_host_prog = '/usr/bin/python3'
	" let g:python3_host_prog = '/~/.pyenv/versions/python364/bin/python'

	"" To disable Python 2 support:
	" let g:loaded_python_provider = 1
else
	let g:python3_host_prog = 'C:/ProgramData/Anaconda3-5.2.0/python.exe'
endif

" your directory with your local .vim-files to load
let g:local_source_dir='~/Dropbox/ActiveHome/config/nvim/'

" environment related variables
" vimwiki directory
if has('unix')
	let g:wiki_dir = '~/Dropbox/PKD/vimwiki/'
else
	let g:wiki_dir = '~/vimwiki/'
end



" === Rafi ===:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

