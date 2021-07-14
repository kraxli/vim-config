if dein#tap('vim-sandwich')
	"" unmap / release some sandwich-operator mappings
	" silent! nunmap sd  " or	nnoremap sd  <Nop>
	" silent! nunmap sr
	"
	" nmap <silent> sdq <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	" nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	" nmap <silent> srq <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	" nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

	nmap <silent> sdd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	nmap <silent> srr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
endif

if dein#tap('vim-quickhl')
	nmap <s-m>t <Plug>(quickhl-manual-reset)
	xmap <s-m>t <Plug>(quickhl-manual-reset)
endif


if dein#tap('gina.vim')
	command! -nargs=* Git :Gina <args>
endif


if dein#tap('Nvim-R')
	   let R_assign_map = '__'

" 	function! s:customNvimRMappings()
" 		nmap <buffer> <Leader>sr <Plug>RStart
" 		imap <buffer> <Leader>sr <Plug>RStart
" 		vmap <buffer> <Leader>sr <Plug>RStart
" 		" ....
" 	endfunction
"
" 	augroup myNvimR
" 		au!
" 		autocmd filetype r call s:customNvimRMappings()
" 	augroup end

endif

