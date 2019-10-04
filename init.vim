
" === Kraxli ===:
let g:path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/')
let g:nvim_dir = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.path_sep.'?')  " see :h filename-modifiers  /  use $VIM_PATH

if filereadable($VIM_PATH.'/config_loc/config_pre.vim')
	call etc#util#source_file('config_loc/config_pre.vim')
endif


" === Rafi ===:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'
