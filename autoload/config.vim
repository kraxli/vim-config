
function config#mkdx_mappings()
    " use t or ; a regular prefix (except for most important maps)

    augroup Mkdx
	au!
	nmap ;x <Plug>(mkdx-promote-header)  " <c-=>
	nmap ;a <Plug>(mkdx-demote-header)   " <c-0>
	nmap <c-0> <Plug>(mkdx-demote-header)  " <c-=>

	" silent! nunmap <buffer> <c-space>
	" nmap <c-space>	<Plug>(mkdx-checkbox-next-n)

	nmap ;l <Plug>(mkdx-toggle-list-n)
	vmap ;l <Plug>(mkdx-toggle-list-v)

	silent! nunmap <buffer> ;c
	vmap ;c <Nop>
	nmap ;c <Plug>(mkdx-toggle-checklist-n)
	vmap ;c <Plug>(mkdx-toggle-checklist-v)

	vmap ;k <Nop>
	nmap ;k <Plug>(mkdx-toggle-to-kbd-n)
	vmap ;k <Plug>(mkdx-toggle-to-kbd-v)

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
