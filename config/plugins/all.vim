" Plugin Keyboard-Mappings
" ---

if dein#tap('denite.nvim')
	nnoremap <silent>;r :<C-u>Denite -resume -refresh -no-start-filter<CR>
	nnoremap <silent>;f :<C-u>Denite file/rec<CR>
	nnoremap <silent>;g :<C-u>Denite grep -start-filter<CR>
	nnoremap <silent>;b :<C-u>Denite buffer -default-action=switch<CR>
	nnoremap <silent>;i :<C-u>Denite file/old<CR>
	nnoremap <silent>;d :<C-u>Denite directory_rec directory_mru -default-action=cd<CR>
	nnoremap <silent>;v :<C-u>Denite neoyank -buffer-name=register<CR>
	xnoremap <silent>;v :<C-u>Denite neoyank -buffer-name=register -default-action=replace<CR>
	nnoremap <silent>;l :<C-u>Denite location_list -buffer-name=list -no-start-filter<CR>
	nnoremap <silent>;q :<C-u>Denite quickfix -buffer-name=list -no-start-filter<CR>
	nnoremap <silent>;m :<C-u>Denite mark<CR>
	nnoremap <silent>;n :<C-u>Denite dein<CR>
	nnoremap <silent>;j :<C-u>Denite jump change file/point -no-start-filter<CR>
	nnoremap <silent>;u :<C-u>Denite junkfile:new junkfile -buffer-name=list<CR>
	nnoremap <silent>;o :<C-u>Denite outline -no-start-filter<CR>
	nnoremap <silent>;s :<C-u>Denite session -buffer-name=list<CR>
	nnoremap <silent>;t :<C-u>Denite tag<CR>
	nnoremap <silent>;p :<C-u>Denite jump<CR>
	nnoremap <silent>;h :<C-u>Denite help<CR>
	nnoremap <silent>;w :<C-u>Denite file/rec -buffer-name=memo -path=~/docs/blog<CR>
	nnoremap <silent>;x :<C-u>Denite file_mru<CR>
	nnoremap <silent>;z :<C-u>Denite z -buffer-name=list<CR>
	nnoremap <silent>;; :<C-u>Denite command_history command<CR>
	nnoremap <silent><expr>;/ wordcount().chars > 10000 ?
		\ ":\<C-u>Denite -search line/external\<CR>"
		\ : ":\<C-u>Denite -search line\<CR>"
	nnoremap <silent><expr><LocalLeader>* wordcount().chars > 10000 ?
		\ ":\<C-u>DeniteCursorWord -no-start-filter -search line/external\<CR>"
		\ : ":\<C-u>DeniteCursorWord -no-start-filter -search line\<CR>"

	" Open Denite with word under cursor or selection
	nnoremap <silent> ;gt :DeniteCursorWord tag:include -no-start-filter -immediately<CR>
	nnoremap <silent> ;gf :DeniteCursorWord file/rec -no-start-filter<CR>

	nnoremap <silent> ;gg :DeniteCursorWord grep -no-start-filter<CR>
	vnoremap <silent> ;gg
		\ :<C-u>call <SID>get_selection('/')<CR>
		\ :execute 'Denite -no-start-filter grep:::'.escape(@/, ' :')<CR><CR>

endif

if dein#tap('vim-clap')
	" nnoremap <silent><LocalLeader>f :<C-u>Clap! files<CR>
	" nnoremap <silent><LocalLeader>b :<C-u>Clap! buffers<CR>
	" nnoremap <silent><LocalLeader>g :<C-u>Clap! grep<CR>
	" nnoremap <silent><LocalLeader>j :<C-u>Clap! jumps<CR>
	" nnoremap <silent><LocalLeader>h :<C-u>Clap! help_tags<CR>
	" nnoremap <silent><LocalLeader>t :<C-u>Clap! tags<CR>
	" nnoremap <silent><LocalLeader>l :<C-u>Clap! loclist<CR>
	" nnoremap <silent><LocalLeader>q :<C-u>Clap! quickfix<CR>
	" nnoremap <silent><LocalLeader>m :<C-u>Clap! files ~/docs/books<CR>
	" nnoremap <silent><LocalLeader>y :<C-u>Clap! yanks<CR>
	" nnoremap <silent><LocalLeader>/ :<C-u>Clap! lines<CR>
	" nnoremap <silent><LocalLeader>* :<C-u>Clap! lines ++query=<cword><CR>
	" nnoremap <silent><LocalLeader>; :<C-u>Clap! command_history<CR>

	" nnoremap <silent><Leader>gl :<C-u>Clap! commits<CR>
	" nnoremap <silent><Leader>gt :<C-u>Clap! tags ++query=<cword><CR>
	" xnoremap <silent><Leader>gt :<C-u>Clap! tags ++query=@visual<CR><CR>
	" nnoremap <silent><Leader>gf :<C-u>Clap! files ++query=<cword><CR>
	" xnoremap <silent><Leader>gf :<C-u>Clap! files ++query=@visual<CR><CR>
	" nnoremap <silent><Leader>gg :<C-u>Clap! grep ++query=<cword><CR>
	" xnoremap <silent><Leader>gg :<C-u>Clap! grep ++query=@visual<CR><CR>

	autocmd user_events FileType clap_input call s:clap_mappings()

	function! s:clap_mappings()
		nnoremap <silent> <buffer> <nowait> <Space> :call clap#handler#tab_action()<CR>
		nnoremap <silent> <buffer> <nowait>' :call clap#handler#tab_action()<CR>
		inoremap <silent> <buffer> <Tab>   <C-R>=clap#navigation#linewise('down')<CR>
		inoremap <silent> <buffer> <S-Tab> <C-R>=clap#navigation#linewise('up')<CR>
		nnoremap <silent> <buffer> <C-j> :<C-u>call clap#navigation#linewise('down')<CR>
		nnoremap <silent> <buffer> <C-k> :<C-u>call clap#navigation#linewise('up')<CR>
		nnoremap <silent> <buffer> <C-n> :<C-u>call clap#navigation#linewise('down')<CR>
		nnoremap <silent> <buffer> <C-p> :<C-u>call clap#navigation#linewise('up')<CR>
		nnoremap <silent> <buffer> <C-f> :<c-u>call clap#navigation#scroll('down')<CR>
		nnoremap <silent> <buffer> <C-b> :<c-u>call clap#navigation#scroll('up')<CR>

		nnoremap <silent> <buffer> sg  :<c-u>call clap#handler#try_open('ctrl-v')<CR>
		nnoremap <silent> <buffer> sv  :<c-u>call clap#handler#try_open('ctrl-x')<CR>
		nnoremap <silent> <buffer> st  :<c-u>call clap#handler#try_open('ctrl-t')<CR>

		nnoremap <silent> <buffer> q     :<c-u>call clap#handler#exit()<CR>
		nnoremap <silent> <buffer> <Esc> :call clap#handler#exit()<CR>
		inoremap <silent> <buffer> <Esc> <C-R>=clap#navigation#linewise('down')<CR><C-R>=clap#navigation#linewise('up')<CR><Esc>
		inoremap <silent> <buffer> jj    <C-R>=clap#navigation#linewise('down')<CR><C-R>=clap#navigation#linewise('up')<CR><Esc>
	endfunction
endif

if dein#tap('vim-lsp')
	" Close preview window with Escape
	autocmd User lsp_float_opened
		\ nmap <buffer> <silent> <Esc> <Plug>(lsp-preview-close)
	autocmd User lsp_float_closed silent! nunmap <buffer> <Esc>
	autocmd user_events FileType markdown.lsp-hover
		\ nmap <silent><buffer>q :pclose<CR>| doautocmd <nomodeline> BufWinEnter
endif

if dein#tap('defx.nvim')
	nnoremap <silent> <LocalLeader>e
		\ :<C-u>Defx -toggle -buffer-name=explorer`tabpagenr()`<CR>
	nnoremap <silent> <localleader>a
		\ :<C-u>Defx
		\		-toggle
		\   -search=`escape(expand('%:p'), ' :')`
		\   -buffer-name=explorer`tabpagenr()`<CR>
endif

if dein#tap('delimitMate')
	imap <buffer><expr> <C-Tab> delimitMate#JumpAny()
endif

if dein#tap('vista.vim')
	nnoremap <silent> <Leader>b :<C-u>Vista<CR>
	nnoremap <silent> <Leader>a :<C-u>Vista show<CR>
endif

" if dein#tap('vista.vim')
" 	nnoremap <silent> <Leader>t :<C-u>Vista!!<CR>
" 	au FileType vista nnoremap <silent> <buffer> <leader>t Vista!!<CR>
" 	au FileType markdown,vimwiki noremap <silent> <buffer> <leader>t :<C-u>Vista toc<CR>
" 
" 	nnoremap <silent> <Leader>a :<C-u>Vista show<CR>
" 	au FileType vista nmap <silent> <buffer> <leader>a q
" endif


if dein#tap('emmet-vim')
	autocmd user_events FileType html,css,javascript,javascriptreact,svelte
		\ EmmetInstall
		\ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)
endif

if dein#tap('vim-gitgutter')
	nmap ]g <Plug>(GitGutterNextHunk)
	nmap [g <Plug>(GitGutterPrevHunk)
	nmap gS <Plug>(GitGutterStageHunk)
	xmap gS <Plug>(GitGutterStageHunk)
	nmap <Leader>gr <Plug>(GitGutterUndoHunk)
	nmap gs <Plug>(GitGutterPreviewHunk)
endif

if dein#tap('iron.nvim')
	nmap <silent> <Leader>rr :<C-u>IronRepl<CR><Esc>
	nmap <silent> <Leader>rq <Plug>(iron-exit)
	nmap <silent> <Leader>rl <Plug>(iron-send-line)
	vmap <silent> <Leader>rl <Plug>(iron-visual-send)
	nmap <silent> <Leader>rs <Plug>(iron-send-line)
	vmap <silent> <Leader>rs <Plug>(iron-visual-send)
	nmap <silent> <Leader>rp <Plug>(iron-repeat-cmd)
	nmap <silent> <Leader>rc <Plug>(iron-clear)
	nmap <silent> <Leader>r<CR>  <Plug>(iron-cr)
	nmap <silent> <Leader>r<Esc> <Plug>(iron-interrupt)
endif

if dein#tap('vim-sandwich')
	nmap <silent> sa <Plug>(operator-sandwich-add)
	xmap <silent> sa <Plug>(operator-sandwich-add)
	omap <silent> sa <Plug>(operator-sandwich-g@)
	nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sd <Plug>(operator-sandwich-delete)
	nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sr <Plug>(operator-sandwich-replace)
	nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	omap ir <Plug>(textobj-sandwich-auto-i)
	xmap ir <Plug>(textobj-sandwich-auto-i)
	omap ab <Plug>(textobj-sandwich-auto-a)
	xmap ab <Plug>(textobj-sandwich-auto-a)
	omap is <Plug>(textobj-sandwich-query-i)
	xmap is <Plug>(textobj-sandwich-query-i)
	omap as <Plug>(textobj-sandwich-query-a)
	xmap as <Plug>(textobj-sandwich-query-a)

	" The inputs `t` and `T` support to edit HTML style tags. `saiwt` ask
	" user to input a name of element
endif

if dein#tap('vim-operator-replace')
	xmap p <Plug>(operator-replace)
endif

if dein#tap('vim-niceblock')
	silent! xmap I  <Plug>(niceblock-I)
	silent! xmap gI <Plug>(niceblock-gI)
	silent! xmap A  <Plug>(niceblock-A)
endif

if dein#tap('accelerated-jk')
	nmap <silent> j <Plug>(accelerated_jk_gj)
	nmap <silent> k <Plug>(accelerated_jk_gk)
endif

if dein#tap('vim-edgemotion')
	map gj <Plug>(edgemotion-j)
	map gk <Plug>(edgemotion-k)
	xmap gj <Plug>(edgemotion-j)
	xmap gk <Plug>(edgemotion-k)
endif

if dein#tap('vim-quickhl')
	nmap <Leader>mt <Plug>(quickhl-manual-this)
	xmap <Leader>mt <Plug>(quickhl-manual-this)
endif

if dein#tap('vim-sidemenu')
	nmap <Leader>l <Plug>(sidemenu)
	xmap <Leader>l <Plug>(sidemenu-visual)
endif

if dein#tap('vim-indent-guides')
	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>
endif

if dein#tap('vim-signature')
	let g:SignatureIncludeMarks = 'abcdefghijkloqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
	let g:SignatureMap = {
		\ 'Leader':            'm',
		\ 'ListBufferMarks':   'm/',
		\ 'ListBufferMarkers': 'm?',
		\ 'PlaceNextMark':     'm,',
		\ 'ToggleMarkAtLine':  'mm',
		\ 'PurgeMarksAtLine':  'm-',
		\ 'DeleteMark':        'dm',
		\ 'PurgeMarks':        'm<Space>',
		\ 'PurgeMarkers':      'm<BS>',
		\ 'GotoNextLineAlpha': "']",
		\ 'GotoPrevLineAlpha': "'[",
		\ 'GotoNextSpotAlpha': '`]',
		\ 'GotoPrevSpotAlpha': '`[',
		\ 'GotoNextLineByPos': "]'",
		\ 'GotoPrevLineByPos': "['",
		\ 'GotoNextSpotByPos': 'mn',
		\ 'GotoPrevSpotByPos': 'mp',
		\ 'GotoNextMarker':    ']-',
		\ 'GotoPrevMarker':    '[-',
		\ 'GotoNextMarkerAny': ']=',
		\ 'GotoPrevMarkerAny': '[=',
		\ }
endif

if dein#tap('auto-git-diff')
	autocmd user_events FileType gitrebase
		\  nmap <buffer><CR>  <Plug>(auto_git_diff_scroll_manual_update)
		\| nmap <buffer><C-n> <Plug>(auto_git_diff_scroll_down_page)
		\| nmap <buffer><C-p> <Plug>(auto_git_diff_scroll_up_page)
		\| nmap <buffer><C-d> <Plug>(auto_git_diff_scroll_down_half)
		\| nmap <buffer><C-u> <Plug>(auto_git_diff_scroll_up_half)
endif

if dein#tap('committia.vim')
	let g:committia_hooks = {}
	function! g:committia_hooks.edit_open(info)
		setlocal winminheight=1 winheight=10
		resize 10
		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
		imap <buffer><C-f> <Plug>(committia-scroll-diff-down-page)
		imap <buffer><C-b> <Plug>(committia-scroll-diff-up-page)
		imap <buffer><C-j> <Plug>(committia-scroll-diff-down)
		imap <buffer><C-k> <Plug>(committia-scroll-diff-up)
	endfunction
endif

if dein#tap('python_match.vim')
	autocmd user_events FileType python
		\ nmap <buffer> {{ [%
		\ | nmap <buffer> }} ]%
endif

if dein#tap('goyo.vim')
	nnoremap <Leader>G :Goyo<CR>
endif

if dein#tap('vim-shot-f')
	nmap f  <Plug>(shot-f-f)
	nmap F  <Plug>(shot-f-F)
	nmap t  <Plug>(shot-f-t)
	nmap T  <Plug>(shot-f-T)
	xmap f  <Plug>(shot-f-f)
	xmap F  <Plug>(shot-f-F)
	xmap t  <Plug>(shot-f-t)
	xmap T  <Plug>(shot-f-T)
	omap f  <Plug>(shot-f-f)
	omap F  <Plug>(shot-f-F)
	omap t  <Plug>(shot-f-t)
	omap T  <Plug>(shot-f-T)
endif

if dein#tap('vimwiki')
	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
	" expand iabbrev on enter
	inoremap <silent><buffer> <m-CR> <C-]><Esc>:VimwikiReturn 1 5<CR>
	inoremap <silent><buffer> <S-CR> <Esc>:VimwikiReturn 2 2<CR>
endif

if dein#tap('vim-choosewin')
	nmap -         <Plug>(choosewin)
	nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('vimagit')
	nnoremap <silent> <Leader>mg :Magit<CR>
endif

if dein#tap('gina.vim')
	nnoremap <silent> <leader>ga :Gina add %:p<CR>
	nnoremap <silent> <leader>gd :Gina compare<CR>
	nnoremap <silent> <leader>gc :Gina commit<CR>
	nnoremap <silent> <leader>gb :Gina blame --width=40<CR>
	nnoremap <silent> <leader>gs :Gina status -s<CR>
	nnoremap <silent> <leader>gl :Gina log --graph --all<CR>
	nnoremap <silent> <leader>gF :Gina! fetch<CR>
	nnoremap <silent> <leader>gp :Gina! push<CR>
	nnoremap <silent> <leader>go :,Gina browse :<CR>
	vnoremap <silent> <leader>go :Gina browse :<CR>
endif

if dein#tap('vim-altr')
	nmap <leader>n  <Plug>(altr-forward)
	nmap <leader>N  <Plug>(altr-back)
endif

if dein#tap('any-jump.vim')
	" Normal mode: Jump to definition under cursor
	nnoremap <silent> <leader>ii :AnyJump<CR>

	" Visual mode: jump to selected text in visual mode
	xnoremap <silent> <leader>ii :AnyJumpVisual<CR>

	" Normal mode: open previous opened file (after jump)
	nnoremap <silent> <leader>ib :AnyJumpBack<CR>

	" Normal mode: open last closed search window again
	nnoremap <silent> <leader>il :AnyJumpLastResults<CR>
endif

if dein#tap('undotree')
	nnoremap <Leader>gu :UndotreeToggle<CR>
endif

if dein#tap('thesaurus_query.vim')
	nnoremap <silent> <Leader>K :<C-u>ThesaurusQueryReplaceCurrentWord<CR>
endif

if dein#tap('vim-asterisk')
	map *   <Plug>(asterisk-g*)
	map g*  <Plug>(asterisk-*)
	map #   <Plug>(asterisk-g#)
	map g#  <Plug>(asterisk-#)

	map z*  <Plug>(asterisk-z*)
	map gz* <Plug>(asterisk-gz*)
	map z#  <Plug>(asterisk-z#)
	map gz# <Plug>(asterisk-gz#)
endif

if dein#tap('vim-expand-region')
	xmap v <Plug>(expand_region_expand)
	xmap V <Plug>(expand_region_shrink)
endif

if dein#tap('sideways.vim')
	nnoremap <silent> 2l :SidewaysLeft<CR>  " :l or m2l
	nnoremap <silent> 2r :SidewaysRight<CR> " :r or m2r
	nnoremap <silent> [, :SidewaysJumpLeft<CR>
	nnoremap <silent> ], :SidewaysJumpRight<CR>
	omap <silent> a, <Plug>SidewaysArgumentTextobjA
	xmap <silent> a, <Plug>SidewaysArgumentTextobjA
	omap <silent> i, <Plug>SidewaysArgumentTextobjI
	xmap <silent> i, <Plug>SidewaysArgumentTextobjI
endif

if dein#tap('splitjoin.vim')
	let g:splitjoin_join_mapping = ''
	let g:splitjoin_split_mapping = ''
	nmap sj :SplitjoinJoin<CR>
	nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('linediff.vim')
	vnoremap <Leader>mdf :Linediff<CR>
	vnoremap <Leader>mda :LinediffAdd<CR>
	nnoremap <Leader>mds :<C-u>LinediffShow<CR>
	nnoremap <Leader>mdr :<C-u>LinediffReset<CR>
endif

if dein#tap('dsf.vim')
	nmap dsf <Plug>DsfDelete
	nmap csf <Plug>DsfChange
endif

if dein#tap('caw.vim')
	function! InitCaw() abort
		if &l:modifiable && &buftype ==# '' && &filetype != 'gitrebase'
			xmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
			nmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
			xmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
			nmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
			nmap <buffer> gc <Plug>(caw:prefix)
			xmap <buffer> gc <Plug>(caw:prefix)
			nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
			xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
		else
			silent! nunmap <buffer> <Leader>V
			silent! xunmap <buffer> <Leader>V
			silent! nunmap <buffer> <Leader>v
			silent! xunmap <buffer> <Leader>v
			silent! nunmap <buffer> gc
			silent! xunmap <buffer> gc
			silent! nunmap <buffer> gcc
			silent! xunmap <buffer> gcc
		endif
	endfunction
	autocmd user_events FileType * call InitCaw()
	call InitCaw()
endif

if dein#tap('fin.vim')
	nnoremap <Leader>f :<C-u>Fin<CR>

	function! InitFin() abort
		cmap <buffer><nowait> <Tab>   <Plug>(fin-line-next)
		cmap <buffer><nowait> <S-Tab> <Plug>(fin-line-prev)
		cmap <buffer><nowait> <C-j>   <Plug>(fin-line-next)
		cmap <buffer><nowait> <C-k>   <Plug>(fin-line-prev)
	endfunction
	autocmd user_events FileType fin call InitFin()
endif

if dein#tap('vim-textobj-function')
	omap <silent> af <Plug>(textobj-function-a)
	omap <silent> if <Plug>(textobj-function-i)
	xmap <silent> af <Plug>(textobj-function-a)
	xmap <silent> if <Plug>(textobj-function-i)
endif

if dein#tap('unfog-io/unfog-vim')
	nmap <cr>   <plug>(unfog-toggle)
	nmap K      <plug>(unfog-info)
	nmap gc     <plug>(unfog-context)
	nmap gw     <plug>(unfog-worktime)
	nmap <c-n>  <plug>(unfog-next-cell)
	nmap <c-p>  <plug>(unfog-prev-cell)
	nmap dic    <plug>(unfog-delete-in-cell)
	nmap cic    <plug>(unfog-change-in-cell)
	nmap vic    <plug>(unfog-visual-in-cell)
endif


if dein#tap('soywod/kronos.vim')
	nmap <leader>      :Kronos<cr>
	nmap <cr>   <plug>(kronos-toggle)
	" nmap K      <plug>(kronos-info)
	nmap ki      <plug>(kronos-info)
	nmap gc     <plug>(kronos-context)
	nmap gs     <plug>(kronos-sort-asc)
	nmap gS     <plug>(kronos-sort-desc)
	nmap gh     <plug>(kronos-hide-done)
	nmap gw     <plug>(kronos-worktime)
	nmap <c-n>  <plug>(kronos-next-cell)
	nmap <c-p>  <plug>(kronos-prev-cell)
	nmap dic    <plug>(kronos-delete-in-cell)
	nmap cic    <plug>(kronos-change-in-cell)
	nmap vic    <plug>(kronos-visual-in-cell)
endif


if dein#tap('kraxli/vim-mkd-fold')
	autocmd FileType markdown,vimwiki,text setl foldmethod=expr
endif


if dein#tap('samoshkin/vim-mergetool')
	nmap ;mt <plug>(MergetoolToggle)
endif

if dein#tap('fzf.vim')
	" --- Not repliated by FZF (use ; instead of localleader) ---
	" nnoremap <silent><localleader>r :<C-u>Denite -resume -refresh -no-start-filter<CR>
	" nnoremap <silent><localleader>d :<C-u>Denite directory_rec directory_mru -default-action=cd<CR>
	" nnoremap <silent><localleader>v :<C-u>Denite neoyank -buffer-name=register<CR>
	" xnoremap <silent><localleader>v :<C-u>Denite neoyank -buffer-name=register -default-action=replace<CR>
	" nnoremap <silent><localleader>l :<C-u>Denite location_list -buffer-name=list -no-start-filter<CR>
	" nnoremap <silent><localleader>j :<C-u>Denite jump change file/point -no-start-filter<CR>
	" nnoremap <silent><localleader>n :<C-u>Denite dein<CR>
	" nnoremap <silent><localleader>u :<C-u>Denite junkfile:new junkfile -buffer-name=list<CR>
	" nnoremap <silent><localleader>o :<C-u>Denite outline -no-start-filter<CR>
	" nnoremap <silent><localleader>p :<C-u>Denite jump<CR>
	" nnoremap <silent><localleader>h :<C-u>Denite help<CR>
	" nnoremap <silent><localleader>w :<C-u>Denite file/rec -buffer-name=memo -path=~/docs/blog<CR>
	" nnoremap <silent><localleader>x :<C-u>Denite file_mru<CR>
	" nnoremap <silent><localleader>z :<C-u>Denite z -buffer-name=list<CR>


	" --- Remapped from Denite (as close as possible) ---
	nnoremap <silent><localleader>f :call fzf#vim#files('', extend({'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:60%:hidden']}, {'window': {'height': 0.5,  'width': 0.5}}), 0)<cr>
	nnoremap <silent><localleader>b :call fzf#vim#buffers('', fzf#vim#with_preview(extend({'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:60%:hidden']}, {'window': {'height': 0.5,  'width': 0.5 }})), 0)<cr>
	nnoremap <silent><localleader>i :call fzf#vim#history(fzf#vim#with_preview(extend({'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:60%:hidden']}, {'window': {'height': 0.5,  'width': 0.4 }})), 0)<cr>
	nnoremap <silent><localleader>m :call fzf#vim#marks(fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:50%:hidden'], 'window': {'height': 0.5,  'width': 0.75}}), 0)<cr>
	nnoremap <silent><localleader>; :call fzf#vim#command_history(fzf#vim#with_preview(s:fzf_spec), 0)<cr>
	nnoremap <silent><localleader>t :call fzf#vim#tags('', fzf#vim#with_preview({ "placeholder": "--tag {2}:{-1}:{3}", 'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:50%:hidden'], 'window': {'height': 0.5,  'width': 0.75}}), 0)<cr>
	nnoremap <silent><localleader>h :call fzf#vim#helptags(fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end', '--preview-window', 'hidden'], 'down': '40%', 'window': { 'height': 0.5, 'width': 0.7 }}), 0)<cr>
	nnoremap <silent><localleader>/ :call fzf#vim#lines('', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end', '--preview-window', 'hidden'], 'down': '40%', 'window': { 'height': 0.5, 'width': 0.6 }}), 0)<cr>
	" nnoremap <silent><localleader>/ :call fzf#vim#buffer_lines('', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end', '--preview-window', 'hidden'], 'down': '40%', 'window': { 'height': 0.5, 'width': 0.6 }}), 0)<cr>
	vnoremap <silent> <localleader>*
			\ :<C-u>call <SID>get_selection('/')<CR>
			\ :execute 'call fzf#vim#lines(' .shellescape(@/, " :") . ', fzf#vim#with_preview({"options": ["--layout=reverse", "--info=inline", "--exact", "--tiebreak=end", "--preview-window", "hidden"], "down": "40%", "window": { "height": 0.5, "width": 0.6 }}), 0)'<cr>
	vnoremap <silent> ;gt
			\ :<C-u>call <SID>get_selection('/')<CR>
			\ :execute 'call fzf#vim#tags(' .shellescape(@/, " :") . ', fzf#vim#with_preview({ "placeholder": "--tag {2}:{-1}:{3}", "options": ["--layout=reverse", "--info=inline", "--preview-window", "right:50%:hidden"], "window": {"height": 0.5,  "width": 0.75}}), 0)'<cr>
	vnoremap <silent> ;gf
			\ :<C-u>call <SID>get_selection('/')<CR>
			\ :execute 'call fzf#vim#files(' .shellescape(@/, " :") . ', extend({"options": ["--layout=reverse", "--info=inline", "--preview-window", "right:60%:hidden"]}, {"window": {"height": 0.5,  "width": 0.5}}), 0)'<cr>


	" --- Deviating from Denite ---
  nmap <silent> <localleader>gg :call fzf#vim#ag('', {'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end'], 'down': '40%', 'window': { 'width': 0.9, 'height': 0.6 }}, 0)<cr>
  " nnoremap <silent> <leader>gg :call fzf#vim#ag(expand('<cword>'), {'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end'], 'down': '40%', 'window': { 'width': 0.9, 'height': 0.6 }}, 0)<cr>
  nnoremap <silent> <localleader>gw :call fzf#vim#ag(expand('<cword>'), {'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end'], 'down': '40%', 'window': { 'width': 0.9, 'height': 0.6 }}, 0)<cr>
	vnoremap <silent> <localleader>gw
			\ :<C-u>call <SID>get_selection('/')<CR>
			\ :execute 'call fzf#vim#ag(' .shellescape(@/, " :") . ', {"options": ["--layout=reverse", "--info=inline", "--exact", "--tiebreak=end"], "down": "40%", "window": { "width": 0.9, "height": 0.6 }}, 0)'<cr>

	nnoremap <silent><localleader>gc :call fzf#vim#commits(fzf#vim#with_preview({ "placeholder": "" , 'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end'], 'down': '40%', 'window': { 'width': 0.9, 'height': 0.6 }}), 0)<cr>
	nnoremap <silent><localleader>gb :call fzf#vim#buffer_commits(fzf#vim#with_preview({ "placeholder": "" , 'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end'], 'down': '40%', 'window': { 'width': 0.9, 'height': 0.6 }}), 0)<cr>
	nnoremap <silent><localleader>gf :call fzf#vim#gitfiles('', fzf#vim#with_preview({ "placeholder": "" , 'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end', '--preview-window', 'right:60%'], 'down': '40%', 'window': { 'width': 0.7, 'height': 0.5 }}), 0)<cr>

	" --- Not available with Denite ---
	nnoremap <silent>;c :call fzf#vim#commands(fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end', '--preview-window', 'hidden'], 'down': '40%', 'window': { 'height': 0.5, 'width': 0.9 }}), 0)<cr>
	nnoremap <silent><localleader>s :call fzf#vim#snippets(fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end', '--preview-window', 'hidden'], 'down': '40%', 'window': { 'height': 0.5, 'width': 0.4 }}), 0)<cr>
	nnoremap <silent><localleader>w :call fzf#vim#windows(fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--exact', '--tiebreak=end', '--preview-window', 'hidden'], 'down': '40%', 'window': { 'height': 0.5, 'width': 0.4 }}), 0)<cr>
	nnoremap <silent>;a :call fzf#vim#maps('', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:60%:hidden'], 'window': {'height': 0.5,  'width': 0.6 }}), 0)<cr>
	nnoremap <silent><localleader>, :call  fzf#vim#search_history(fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:60%:hidden'], 'window': {'height': 0.5,  'width': 0.6 }}), 0)<cr>
	nnoremap <silent><localleader>d :call fzf#vim#locate('', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:60%'], 'window': {'height': 0.5,  'width': 0.6 }}), 0)<cr>

	" --- No key-mappings ---
	" command!      -bang -nargs=* BLines                     call fzf#vim#lines(<q-args>, fzf#vim#with_preview(s:fzf_spec), <bang>0)
	" command!      -bang -nargs=* BTags                     call fzf#vim#buffer_tags(<q-args>, fzf#vim#with_preview(extend({ "placeholder": "{2}:{3}"}, s:fzf_spec)), <bang>0)

endif

if dein#tap('fzf-quickfix')
	" nnoremap <silent><localleader>q :Quickfix<cr>
  nnoremap <silent><localleader>q :call fzf_quickfix#run('', '0', {'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:60%:hidden'], 'window': {'height': 0.5,  'width': 0.6 }}, 0)<cr>
  nnoremap <silent><localleader>l :call fzf_quickfix#run('', '1', {'options': ['--layout=reverse', '--info=inline', '--preview-window', 'right:60%:hidden'], 'window': {'height': 0.5,  'width': 0.6 }}, 0)<cr>
endif

if dein#tap('fzf-session.vim')
	" nnoremap <silent>;s :call fzf_session#session()<cr>
	nnoremap <silent><leader>ss :Sessions<cr>
endif

" if dein#tap('SidOfc/mkdx')
" endif


" if dein#tap('SirVer/ultisnips')
"   " UltiSnipsAddFiletypes vimwiki.markdown
" endif

function! s:get_selection(cmdtype)
	let temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, '\' . a:cmdtype), '\n', '\\n', 'g')
	let @s = temp
endfunction
	
" vim: set ts=2 sw=2 tw=80 noet :
