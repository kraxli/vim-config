

augroup kraxli_plugin_filetype " {{{
	autocmd!

	autocmd! FileType,BufRead,BufEnter,WinEnter markdown,vimwiki
		\ nnoremap <leader>li "='- [ ] '<cr>Pa


augroup END "}}}
