
" see: https://vim.fandom.com/wiki/Word_wrap_without_line_breaks
set wrap linebreak nolist
set breakindent
" set breakat
set textwidth=0
set wrapmargin=0 " only used when textwidth=0

" If you want to keep your existing 'textwidth' settings for most lines in your file, but not have Vim automatically reformat when typing on existing lines, you can do this with:
set formatoptions-=t

" If you want Vim to adjust textwidth automatically most of the time but you have a few long lines that you don't want to change, use:
set formatoptions+=l

