
" === Kraxli ===:
let g:path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/')
let g:nvim_dir = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.path_sep.'?')  " see :h filename-modifiers  /  use $VIM_PATH


" === Rafi ===:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'
