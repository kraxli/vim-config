
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

" {{{ function! utils#files_recent(path)
" Reminder: https://jdhao.github.io/2019/04/22/mix_python_and_vim_script/
function! utils#files_recent(path)
let path = a:path

python3 << EOF
import os
import vim
path = vim.eval("path")
files = os.listdir(path)
paths = [os.path.join(path, basename) for basename in files]
files = sorted(paths, key=os.path.getctime, reverse=True)
# vim.command("let files = {}".format(files))
EOF

let files = py3eval('files')
echo files
return files
endfunction
" }}}

function! utils#KeyMaps()
    silent enew|pu=execute('verbose map')
    silent g/\s*Last.*/d
    silent g/^\s*$/d
endfunction
