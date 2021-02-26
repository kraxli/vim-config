
" colorscheme PaperColor "  codedark  PaperColor badwolf

" keep folds on save (https://stackoverflow.com/questions/37552913/vim-how-to-keep-folds-on-save)
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" absolute width of netrw window
let g:netrw_winsize = 25
" The directory banner is mostly useless. To toggle it press I.
let g:netrw_banner = 0
" open file in a new tab
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_liststyle=3
" The available options for `g:netrw_liststyle` are:
"     0: Thin, one file per line
"     1: Long, one file per line with file size and time stamp
"     2: Wide, which is files in columns
"     3: Tree style


augroup ProjectDrawer
  autocmd!
  " autocmd VimEnter * :Vexplore
augroup END

