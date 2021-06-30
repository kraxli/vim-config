
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h
command! Ec :lcd %:p:h | :Ex
command! Ex :Explore
command! V :Vexplore

" Split windows vertically and open empty buffer
command! Vspl :vsp l

" Open Terminal in vertical split
command! VTerm :vsp +term " or :vsp|terminal<Paste>

" save and quit
command! W :w!
command! Q :q
cnoreabbrev <silent> ww w!
cnoreabbrev <silent> wwa wa!
cnoreabbrev <silent> xx x!
cnoreabbrev <silent> xxa xa!
cnoreabbrev <silent> qq q!
cnoreabbrev <silent> qqa qa!
cnoreabbrev <silent> ee e!

" Open vim-config ReadMe
command! ReadMeVimConf :execute('e ' . $VIM_PATH . g:path_sep . 'README.md')

" Spelling
command! SpellEn setl spell spelllang=en
command! SpellDe setl spell spelllang=de
command! SpellEnDe setl spell spelllang=en,de

" --- markdown ---
" change filetpe
command! SetFt2Mkd set filetype=markdown

"""""""""""""""
"  utilities  "
""""""""""""""
command! KeyMaps call utils#KeyMaps()
command! -nargs=1 -complete=file -bar Diff :vert diffsplit <q-args>
command! SwapClean execute('!rm -rf ' . $DATA_PATH . '/swap/*')


