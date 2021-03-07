
if !exists('current_compiler')
  compiler python
endif

setlocal errorformat=%#,%E\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z

" setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]
" setlocal efm=%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]
" setlocal efm=%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%m
" :set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" :set efm=%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


function! s:python_run(...)
  " let efm_global = &efm
  let efm_local = &l:efm

  setlocal errorformat=%#,%E\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z

  AsyncStop

  if a:0 > 1
    AsyncRun python3 a:1
  else
    AsyncRun python3 %:p
  endif

  " let errorformat = efm_global
  let &l:errorformat = efm_local
endfunction

" Run python script
command! -nargs=? Run call <sid>python_run()

