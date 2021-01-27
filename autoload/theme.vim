
function! theme#theme_adjust()
	let l:colors = {
		\ "250": "#bcbcbc",  "251": "#c6c6c6",  "252": "#d0d0d0",
		\ "253": "#dadada",  "254": "#e4e4e4",  "255": "#eeeeee", "7": "#c0c0c0q",
		\ "238": "#444444",  "239": "#4e4e4e",  "240": "#585858", "241": "#606060",
		\ "242": "#666666",  "243": "#767676", "244": "#808080",  "245": "#8a8a8a",
		\ "246": "#949494",  "247": "#9e9e9e",  "248": "#a8a8a8",  "249": "#b2b2b2"
		\ }
	" #986801  #4078f2 #526fff #61afef #5c6370

	if &background =~ 'light'
		let l:color = ""
	endif

	if exists('g:colors_name') && g:colors_name =~ 'one'
		hi Folded gui=italic cterm=italic ctermfg=246 guifg=#949494
		" call one#highlight('Folded', '61afef', '', 'italic')
	else
		hi Folded gui=italic cterm=italic
	endif
endfunction

