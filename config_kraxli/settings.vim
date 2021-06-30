
set nu

set wrap
set linebreak
" set breakat
set textwidth=0
set wrapmargin=0
set breakindent
" let &showbreak=' '
set iskeyword-=-  " do not highlight '-' as cursorword :-)

set colorcolumn=

" Hide the mouse pointer while typing
set mousehide
set mouse=a mousemodel=popup_setpos " popup

" https://www.gregjs.com/vim/2015/lint-as-you-type-with-neovim-and-neomake/
" You can set the amount of undos to remember with set undolevels=X (default is 1000) and of course you can set the undodir to anything you want, but make sure the directory exists! Read :h undo-persistence to learn more.
set undodir=~/.config/nvim/undodir
set undofile
" set noreadonly

set conceallevel=2
set concealcursor=c  " nc
" set concealcursor-=nciv " display all conceal text

if executable('ag')
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif

