
function complete#smart_carriage_return()
	if pumvisible()
		let l:info = complete_info()

		" Detect non-selection and insert new-line
		if get(l:info, 'selected', -1) == -1
			return "\<C-y>\<CR>"
		endif
		" Detect snippet and expand (via UltiSnips)
		if exists('g:UltiSnipsEditSplit')
			let l:menu = get(get(l:info['items'], l:info['selected'], {}), 'menu')
			if len(l:menu) > 0 && stridx(l:menu, 'Snips: ') == 0
				return "\<C-y>\<C-R>=UltiSnips#ExpandSnippet()\<CR>"
			endif
		endif
		" Otherwise, when pum is visible, insert selected completion
		return "\<C-y>"
	endif

	" Expand empty pairs (via delimitMate)
	if get(b:, 'delimitMate_enabled') && delimitMate#WithinEmptyPair()
		return "\<C-R>=delimitMate#ExpandReturn()\<CR>"
	endif

	" Propagate a carriage-return
	return "\<CR>"
endfunction


function! complete#is_whitespace()
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~# '\s'
endfunction
