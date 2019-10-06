
if dein#tap('denite.nvim')

endif




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
