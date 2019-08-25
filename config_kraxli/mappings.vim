
imap jj <esc>
" nnoremap > >>^
" nnoremap < <<$

noremap [d [sz=
noremap ]d ]sz=

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

" jump around
nnoremap g. `.	       " jump to excact last modified position
nnoremap g: '.	       " jump to last modified line
nnoremap gf <c-I>      " move forward in jump list
nnoremap gb <c-O>      " move backward in jump list


" {{{ --- windows / splits ---
		" resize window / split
		" nnoremap <c-w>< <c-w>5<

		" open and colose (new) tab
		map <leader>nt :tabnew<cr>
		map <leader>ct :tabclose<cr>

		" move split windows right / left
		noremap <s-m-Right> <esc><c-w>r
		noremap <silent> <s-m-Left> <esc><c-w>r
		nmap <silent> <m-Down> :hide<cr>
		nmap <silent> <m-Up> :only<cr> " <c-w>o
		nmap <silent> <m-Right> :vsp\|bp<cr>

		" move between split windows
		map <silent> <c-Up> :wincmd k<CR>
		map <silent> <c-Down> :wincmd j<CR>
		map <silent> <c-Left> :wincmd h<CR>
		map <silent> <c-Right> :wincmd l<CR>
" }}}

" {{{ --- Folding ---
		inoremap <c-z> <C-O>za
		nnoremap <c-z> za
		onoremap <c-z> <C-C>za
		" make fold from visual selection
		vnoremap <c-z> zf
		" Focus the current fold by closing all others
		nnoremap <c-s-z> zMza
		" nnoremap <c-s-z> zMzo

		" Search for a pattern then press F10 to fold misses.
		nnoremap <F10> :setlocal foldexpr=(getline(v:lnum)!~@/) foldmethod=expr<CR><Bar>zM
		" TODO: restore original foldmethod (hack: simply by reloading file with ":e" )

		if has('gui')
			nnoremap <s-F10> :setlocal foldexpr=(getline(v:lnum)=~@/) foldmethod=expr<CR><Bar>zM
		else
			nnoremap z<F10> :setlocal foldexpr=(getline(v:lnum)=~@/) foldmethod=expr<CR><Bar>zM
		endif

		" fold by search
		nnoremap zs :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>
" }}} folding

" vim:set foldmethod=marker
