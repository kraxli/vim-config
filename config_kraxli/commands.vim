
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h
command! Ec :lcd %:p:h | :E
command! E :Explore
command! V :Vexplore

" Split windows vertically and open empty buffer
command! Vspl :vsp l

" Open Terminal in vertical split
command! VTerm :vsp +term " or :vsp|terminal<Paste>

" save and quit
command! W :w!
command! Q :q
cnoreabbrev <silent> ww w!
cnoreabbrev <silent> wa wa!
cnoreabbrev <silent> xx x!
cnoreabbrev <silent> xa xa!
cnoreabbrev <silent> qq q!
cnoreabbrev <silent> qa qa!
cnoreabbrev <silent> ee e!

" Open vim-config ReadMe
command! ReadMeVimConf :execute('e ' . $VIM_PATH . g:path_sep . 'README.md')

" Spelling
command! SpellEn setl spell spelllang=en
command! SpellDe setl spell spelllang=de
command! SpellEnDe setl spell spelllang=en,de

" --- markdown ---
" change filetpe
command! SetFtMkd set filetype=markdown
autocmd! FileType markdown command! MarkMap :!markmap %:p


"""""""""""""""
"  utilities  "
"""""""""""""""
command! KeyMaps call utils#KeyMaps()

