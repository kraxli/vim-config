
function config#mkdx_mappings()
    " use t or ; a regular prefix (except for most important maps)

    augroup Mkdx

	au! filetype markdown,vimwiki nmap o <Plug>(mkdx-o)
	au! filetype markdown,vimwiki nmap O <Plug>(mkdx-shift-o)
	au! filetype markdown,vimwiki map <c-space>	<Plug>(mkdx-checkbox-next-n)
	au! filetype markdown,vimwiki map -<space> <Plug>(mkdx-checkbox-prev-n)
	" au! filetype markdown,vimwiki map gx <Plug>(mkdx-gx)
	au! filetype markdown,vimwiki nmap gf <Plug>(mkdx-gf)


	au!

	" nmap gx <Nop>
	" vmap gx <Nop>
	" nmap gx :Open<cr>
	" vmap gx :Open<cr>


	map ;x <Plug>(mkdx-promote-header)  " <c-=>
	map ;a <Plug>(mkdx-demote-header)   " <c-0>
	map ;h <Plug>(mkdx-jump-to-header)

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

	nmap ;l <Plug>(mkdx-toggle-list-n)
	vmap ;l <Plug>(mkdx-toggle-list-v)
	map li <Plug>(mkdx-toggle-list-n)
	map cl <Plug>(mkdx-toggle-checklist-n)
	map ;c <Nop>
	map ;c <Plug>(mkdx-toggle-checklist-n)
	map cn	<Plug>(mkdx-checkbox-next-n)
	map cp <Plug>(mkdx-checkbox-prev-n)


    augroup END

endfunction

