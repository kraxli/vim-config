
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h
command! Ec :lcd %:p:h | :E
command! E :Explore

" Split windows vertically and open empty buffer
command! Vspl :vsp l

command! VTerm :vsp +term " or :vsp|terminal<Paste>

" save and quit
command! W :w
command! Q :q
cnoreabbrev <silent> ww w!
cnoreabbrev <silent> xx x!
cnoreabbrev <silent> qq q!

" Open vim-config ReadMe
command! ReadMeVimConf :execute('e ' . $VIM_PATH . g:path_sep . 'README.md')