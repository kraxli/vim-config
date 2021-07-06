
function! coding#compile()
	execute("compiler " . &filetype)
	make
endfunction


