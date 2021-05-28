" === Kraxli ===
" your directory with your local .vim-files to load
let g:local_source_dir = fnamemodify(expand('<sfile>'), ':h').'/local/'

let g:path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/')
let g:nvim_dir = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.g:path_sep.'?')  " see :h filename-modifiers  /  use $VIM_PATH

" load you local settings
if filereadable(g:local_source_dir . 'init.vim')
	execute 'source ' . g:local_source_dir . 'init.vim'
endif

" === Raphi ===
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'
