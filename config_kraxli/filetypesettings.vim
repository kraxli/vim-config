

augroup kraxli_plugin_filetype " {{{
	autocmd!

	autocmd! FileType,BufRead,BufEnter,WinEnter markdown,vimwiki setfiletype=markdown
		\ nnoremap <leader>li "='- [ ] '<cr>Pa


augroup END "}}}
