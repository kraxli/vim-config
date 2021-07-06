" see e.g. https://vim.fandom.com/wiki/Integrate_Pylint_and_Pychecker_support
" see: https://phelipetls.github.io/posts/vim-errorformat-for-pytest/
" see :help compiler and :help write-compiler-plugin

if exists("current_compiler")
  finish
endif
let current_compiler = "python"

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" compiler options (cpoptions)
let s:cpo_save = &cpo
set cpo&vim

CompilerSet errorformat=
      \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
      \%*\\sFile\ \"%f\"\\,\ line\ %l,
CompilerSet makeprg=python3\ %

let &cpo = s:cpo_save
unlet s:cpo_save

