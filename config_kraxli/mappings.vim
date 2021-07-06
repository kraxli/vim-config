
" --- run code ---

map <F5> :call coding#compile()<cr>

" --- elementary maps ---

imap jj <esc>

" nnoremap > >>
" nnoremap < <<
" nnoremap > >>^
" nnoremap < <<$


" --- spelling and dictionary suggestions ---
noremap [z [sz=
noremap ]z ]sz=

" --- copy & pasting ---
inoremap <c-v> <MiddleMouse>

"" Make shift-insert work like in Xterm
cnoremap <c-v> <MiddleMouse>
cnoremap <S-Insert> <MiddleMouse>
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

" Include Time Stamps
nnoremap <silent> <F4> "=strftime("%Y-%m-%d")<CR>P
inoremap <silent> <F4> <C-R>=strftime("%Y-%m-%d")<CR>
nnoremap <silent> <leader><F4> "=strftime("%H:%M")<CR>P
inoremap <silent> <F3> <C-R>=strftime("%H:%M")<CR>
" or strftime("%T") " to display hour:minutes:seconds

" pop for auto-completion with most recent files
inoremap <silent> <c-r> <C-R>=utils#files_sort_date()<cr>
inoremap <silent> <F7> <C-R>=utils#files_sort_date()<cr>

" jump around
nnoremap g. `.	       " jump to excact last modified position
nnoremap g: '.	       " jump to last modified line
" nnoremap gf <c-I>      " move forward in jump list
" nnoremap gb <c-O>      " move backward in jump list

" Twiddle / toggle case
vnoremap ~ y:call setreg('', utils#TwiddleCase(@"), getregtype(''))<CR>gv""Pgv


" {{{ --- windows / splits ---

		" nmap db :bd<cr> " -> map bd slows down move word backward

		" resize window / split
		" nnoremap <c-w>< <c-w>5<

		" see config/mappings.vim:
		" nnoremap  [Window]   <Nop>
		" nmap      s [Window]

		" open and colose (new) tab
		" map <leader>nt :tabnew<cr>
		map <leader>ct :tabclose<cr>
		nnoremap <silent> [Window]n  :tabnext<CR>
		nnoremap <silent> [Window]p  :tabprev<CR>

		" move split windows right / left
		noremap <s-m-Right> <esc><c-w>r
		noremap <silent> <s-m-Left> <esc><c-w>r
		nnoremap <silent> [Window]a  :<C-u>hide<CR>  " (stow, put, tuck) away
		nnoremap <silent> [Window]o  :<C-u>only<CR>
		" nmap <silent> <m-Down> :hide<cr>
		" nmap <silent> <m-Up> :only<cr> " <c-w>o

		" move between split windows
		map <silent> <c-Up> :wincmd k<CR>
		map <silent> <c-Down> :wincmd j<CR>
		map <silent> <c-Left> :wincmd h<CR>
		map <silent> <c-Right> :wincmd l<CR>
" }}}

" {{{ --- Folding ---
		" toggle folds
		inoremap <c-z> <C-O>za
		nnoremap <c-z> za
		onoremap <c-z> <C-C>za

		" make fold from visual selection
		vnoremap <c-z> zf

		" Focus the current fold by closing all others
		nnoremap <c-s-z> zMza

		" {{{ Keep as reference
				" " Search for a pattern then press F10 to fold misses.
				" nnoremap <F10> :setlocal foldexpr=(getline(v:lnum)!~@/) foldmethod=expr<CR><Bar>zM
				" " TODO: restore original foldmethod (hack: simply by reloading file with ":e" )
				"
				" if has('gui')
				" 	nnoremap <s-F10> :setlocal foldexpr=(getline(v:lnum)=~@/) foldmethod=expr<CR><Bar>zM
				" else
				" 	nnoremap z<F10> :setlocal foldexpr=(getline(v:lnum)=~@/) foldmethod=expr<CR><Bar>zM
				" endif

				" " fold by search
				" nnoremap zs :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0<CR>
		" }}}

" }}} folding

map <silent> <leader>fz :FZF expand('%:p:h')<cr>
map <silent> <leader>ag :Ag expand('%:p:h')<cr>
map <silent> <leader>aw :Ag g:dir_pkd<cr>

" === \\Shortcut to use blackhole register by default ===
" see https://levelup.gitconnected.com/7-surprising-vim-tricks-that-will-save-you-hours-b158d23fe9b7

" --- Deleting without register overwrite: Copy, delete, paste work flow ---
"
" Shortcut to use blackhole register by default:
" nnoremap d "_d
" vnoremap d "_d
" nnoremap D "_D
" vnoremap D "_D
" nnoremap c "_c
" vnoremap c "_c
" nnoremap C "_C
" vnoremap C "_C
" nnoremap x "_x
" vnoremap x "_x
" nnoremap X "_X
" vnoremap X "_X

nnoremap <leader><leader>d "_d
vnoremap <leader><leader>d "_d
nnoremap <leader><leader>D "_D
vnoremap <leader><leader>D "_D
nnoremap <leader><leader>c "_c
vnoremap <leader><leader>c "_c
nnoremap <leader><leader>C "_C
vnoremap <leader><leader>C "_C
nnoremap <leader><leader>x "_x
vnoremap <leader><leader>x "_x
nnoremap <leader><leader>X "_X
vnoremap <leader><leader>X "_X


" vim:set foldmethod=marker
