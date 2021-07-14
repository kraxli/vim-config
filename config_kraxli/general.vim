
" colorscheme PaperColor "  codedark  PaperColor badwolf

let s:syntax_file = 'syntax/general.vim'
let s:syntax_file_path = resolve($VIM_PATH . '/' . s:syntax_file)

augroup folds
  autocmd!
  " remember folding
  " keep folds on save (https://stackoverflow.com/questions/37552913/vim-how-to-keep-folds-on-save)
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview

  autocmd FileType,WinEnter,BufWinEnter,BufReadPost *  execute 'source' fnameescape(s:syntax_file_path)

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

augroup user_plugin_filetype_settings " {{{
	autocmd!

	autocmd FileType markdown let b:sleuth_automatic = 0
	autocmd FileType diff nnoremap q :<C-u>bd<CR>

augroup END


