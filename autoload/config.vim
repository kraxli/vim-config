
function config#mkdx_mappings()
	" use t or ; a regular prefix (except for most important maps)

	augroup Mkdx
    au!
		nmap <c-0> <Plug>(mkdx-promote-header)
		nmap <c-=> <Plug>(mkdx-demote-header)

		" silent! nunmap <buffer> <c-space>
		" nmap <c-space>	<Plug>(mkdx-checkbox-next-n)

		nmap ;l <Plug>(mkdx-toggle-list-n)
		vmap ;l <Plug>(mkdx-toggle-list-v)

		silent! nunmap <buffer> li
		nmap ci <Plug>(mkdx-toggle-checklist-n)

		vmap tk <Nop>
		vmap tk <Plug>(mkdx-toggle-to-kbd-v)

		nmap o <Nop>
		nmap O <Nop>
		nmap o <Plug>(mkdx-o)
		nmap O <Plug>(mkdx-shift-o)

		imap ~<cr> <Plug>(mkdx-fence-backtick)
		imap ~<tab> <Plug>(mkdx-fence-backtick)

		imap <cr> <Plug>(mkdx-enter)
		" imap <c-n> <Plug>(mkdx-ctrl-n-compl)
		" imap <c-p> <Plug>(mkdx-ctrl-p-compl)
		" imap # <Plug>(mkdx-link-compl)
	augroup END

endfunction
