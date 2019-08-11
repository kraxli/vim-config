
colorscheme PaperColor "  codedark  PaperColor badwolf

" keep folds on save (https://stackoverflow.com/questions/37552913/vim-how-to-keep-folds-on-save)
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
