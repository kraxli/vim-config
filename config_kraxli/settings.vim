
set nu
" au BufNewFile,BufRead,BufNew,BufEnter,BufWinEnter * set number

set breakindent
" let &showbreak=' '

set nowrap
set colorcolumn=


" Hide the mouse pointer while typing
set mousehide
set mouse=a mousemodel=popup_setpos " popup

" https://www.gregjs.com/vim/2015/lint-as-you-type-with-neovim-and-neomake/
" You can set the amount of undos to remember with set undolevels=X (default is 1000) and of course you can set the undodir to anything you want, but make sure the directory exists! Read :h undo-persistence to learn more.
set undodir=~/.config/nvim/undodir
set undofile
" set noreadonly


