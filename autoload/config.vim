
function config#mkdx_mappings()
    " use t or ; a regular prefix (except for most important maps)

    augroup Mkdx
	au!
	map ;x <Plug>(mkdx-promote-header)  " <c-=>
	map ;a <Plug>(mkdx-demote-header)   " <c-0>
	map ;h <Plug>(mkdx-jump-to-header)

	" silent! nunmap <buffer> <c-space>
	" nmap <c-space>	<Plug>(mkdx-checkbox-next-n)

	vmap ;k <Nop>
	map ;k <Plug>(mkdx-toggle-to-kbd-n)
	vmap ;k <Plug>(mkdx-toggle-to-kbd-v)

	nmap o <Nop>
	nmap O <Nop>
	nmap o <Plug>(mkdx-o)
	nmap O <Plug>(mkdx-shift-o)

	imap ~<cr> <Plug>(mkdx-fence-backtick)
	imap ~<tab> <Plug>(mkdx-fence-backtick)
	imap `<cr> <Plug>(mkdx-fence-backtick)
	imap `<tab> <Plug>(mkdx-fence-backtick)
	" imap <cr> <Plug>(mkdx-enter)

	nmap gx <Nop>
	vmap gx <Nop>
	" map gx <Plug>(mkdx-gx)
	nmap gx :Open<cr>
	vmap gx :Open<cr>
	" nmap gx :call config#open_url()<cr>
	nmap gf <Plug>(mkdx-gf)

	map <c-space>	<Plug>(mkdx-checkbox-next-n)
	map -<space> <Plug>(mkdx-checkbox-prev-n)

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

