
function config#mkdx_mappings()
    " use t or ; a regular prefix (except for most important maps)


    au! filetype markdown,vimwiki nmap o <Plug>(mkdx-o)
    au! filetype markdown,vimwiki nmap O <Plug>(mkdx-shift-o)
    au! filetype markdown,vimwiki map <c-space>	<Plug>(mkdx-checkbox-next-n)
    au! filetype markdown,vimwiki map -<space> <Plug>(mkdx-checkbox-prev-n)
    " au! filetype markdown,vimwiki map gx <Plug>(mkdx-gx)
    au! filetype markdown,vimwiki nmap gf <Plug>(mkdx-gf)


    augroup Mkdx
	au!

	" nmap gx <Nop>
	" vmap gx <Nop>
	" nmap gx :Open<cr>
	" vmap gx :Open<cr>


	map ;x <Plug>(mkdx-promote-header)  " <c-=>
	map ;a <Plug>(mkdx-demote-header)   " <c-0>
	nmap hi <Plug>(mkdx-promote-header)  " <c-=>
	nmap hd <Plug>(mkdx-demote-header)   " <c-0>
	nmap ;h <Plug>(mkdx-jump-to-header)

	" silent! nunmap <buffer> <c-space>
	" nmap <c-space>	<Plug>(mkdx-checkbox-next-n)

	vmap ;k <Nop>
	map ;k <Plug>(mkdx-toggle-to-kbd-n)
	vmap ;k <Plug>(mkdx-toggle-to-kbd-v)

	imap ~<cr> <Plug>(mkdx-fence-backtick)
	imap ~<tab> <Plug>(mkdx-fence-backtick)
	imap `<cr> <Plug>(mkdx-fence-backtick)
	imap `<tab> <Plug>(mkdx-fence-backtick)
	" imap <cr> <Plug>(mkdx-enter)

	map ;l <Nop>
	map ;l <Plug>(mkdx-toggle-list-n)$
	map ;c <Nop>
	map ;c <Plug>(mkdx-toggle-checklist-n)$
	map <c-space> <Plug>(mkdx-checkbox-next-n)
	map <c-d> <Plug>(mkdx-checkbox-prev-n)


    augroup END

    " nmap <c-space> :call mkdd#ToggleStatusUp()<cr>
    " xmap <c-space> :call mkdd#ToggleStatusUp()<cr>

endfunction


function! s:ToggleStatusUp(...)
  if a:0 == 0 | let lineNum = line('.') | else | let lineNum = a:1 | endif

  let current_line = getline(lineNum)

"     " no list item -> regular list item
"     " regular list item -> to do / check box item
"     " check box item -> check box item in progress
"     " check box item in progress -> check box item done
"     " check box item done -> no list item
endfunction
