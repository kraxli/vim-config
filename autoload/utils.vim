
function! utils#TwiddleCase(str) abort
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction

" TODO: selected item from drop-down is not inserted
" {{{ function! utils#files_recent(path)
function! utils#files_sort_date()
" Reminder: https://jdhao.github.io/2019/04/22/mix_python_and_vim_script/

let subline = getline('.')[0:col('.')-1]
let subline = subline != '' ? subline : expand('%:p:h')
let path = split(subline)[-1]

" TODO: python: how to handle ~/xxx
python3 << EOF
import os
import vim
path = vim.eval("path")
path = vim.eval("expand('%:p:h')") if path[-1] == '' else path
path = path if os.path.isdir(path) else vim.eval("expand('%:p:h')")
path = os.path.expanduser(path)
files = os.listdir(path)
paths = [os.path.join(path, basename) for basename in files]
files = sorted(paths, key=os.path.getctime, reverse=True)
files = [os.path.basename(file) for file in files]
# vim.command("let files = {}".format(files))
EOF

let files = py3eval('files')
call complete(col('.'), files)
return ''

endfunction
" }}}

function! utils#KeyMaps()
    silent enew|pu=execute('verbose map')
    silent g/\s*Last.*/d
    silent g/^\s*$/d
endfunction



