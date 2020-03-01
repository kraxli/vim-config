
" colorscheme PaperColor "  codedark  PaperColor badwolf

" keep folds on save (https://stackoverflow.com/questions/37552913/vim-how-to-keep-folds-on-save)
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  " autocmd VimEnter * :Vexplore
augroup END

