" Plugin Keyboard-Mappings
" ---

if dein#tap('fern.vim')
  nnoremap <silent> <LocalLeader>e :<C-u>Fern -toggle -drawer .<CR>
  nnoremap <silent> <LocalLeader>a :<C-u>Fern -reveal=% -drawer .<CR>
endif

if dein#tap('symbols-outline.nvim')
	nnoremap <silent> <Leader>o :<C-u>SymbolsOutline<CR>
endif

if dein#tap('vim-vsnip')
  imap <expr><C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
  smap <expr><C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
endif

if dein#tap('emmet-vim')
  autocmd user_events FileType html,css,vue,javascript,javascriptreact,svelte
    \ EmmetInstall
    \ | imap <silent><buffer> <C-y> <Plug>(emmet-expand-abbr)
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

if dein#tap('nvim-bqf')
	nmap <silent> <Leader>q <cmd>lua require('user').qflist.toggle()<CR>
endif

if dein#tap('goto-preview')
	nnoremap gb <cmd>lua require('goto-preview').goto_preview_definition()<CR>
	nnoremap go <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
	" nnoremap <Leader>gP <cmd>lua require('goto-preview').close_all_win()<CR>
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

if dein#tap('todo-comments.nvim')
	nnoremap <leader>tt <cmd>TodoTelescope<CR>
endif

if dein#tap('trouble.nvim')
	nnoremap <leader>e <cmd>TroubleToggle lsp_document_diagnostics<CR>
	nnoremap <leader>r <cmd>TroubleToggle lsp_workspace_diagnostics<CR>
	nnoremap <leader>xq <cmd>TroubleToggle quickfix<CR>
	nnoremap <leader>xl <cmd>TroubleToggle loclist<CR>
	nnoremap ]t <cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>
	nnoremap [t <cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>
	nnoremap gR <cmd>TroubleToggle lsp_references<CR>
endif

if dein#tap('diffview.nvim')
  nnoremap <silent> <Leader>gv :<C-u>DiffviewOpen<CR>
endif

if dein#tap('vimwiki')
  nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
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
	" nnoremap <silent> <leader>gp :Gina! push<CR>
	nnoremap <silent> <leader>go :,Gina browse :<CR>
	vnoremap <silent> <leader>go :Gina browse :<CR>
endif

if dein#tap('vim-gitgrep')
  nnoremap <silent> <Leader>;
    \ :<C-u>call gitgrep#run('', expand('<cword>'), { 'ignorecase': 1 })<CR>
  autocmd user_events FileType GitGrep
    \  nnoremap <buffer> gq :<C-u>quit<CR>
    \| nmap <buffer> <nowait> <Space> zak
endif

if dein#tap('zen-mode.nvim')
	nnoremap <silent> <Leader>z <cmd>ZenMode<CR>
endif

if dein#tap('rest.nvim')
	nmap <silent> ,ht <plug>RestNvim
endif

if dein#tap('yaml.nvim')
	nnoremap <silent> ,av <Cmd>lua require("yaml_nvim").view()<CR>
	nnoremap <silent> ,ay <Cmd>lua require("yaml_nvim").yank()<CR>
	" nnoremap <silent> ,aY <Cmd>lua require("yaml_nvim").yank_path()<CR>
	" nnoremap <silent> ,a <Cmd>lua require("yaml_nvim").telescope()<CR>
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

if dein#tap('sideways.vim')
  " nnoremap <silent> 2l :SidewaysLeft<CR>  " :l or m2l
  " nnoremap <silent> 2r :SidewaysRight<CR> " :r or m2r
  nnoremap <silent> r, :SidewaysLeft<CR>
  nnoremap <silent> l, :SidewaysRight<CR>
  nnoremap <silent> [, :SidewaysJumpLeft<CR>
  nnoremap <silent> ], :SidewaysJumpRight<CR>
  omap <silent> a, <Plug>SidewaysArgumentTextobjA
  xmap <silent> a, <Plug>SidewaysArgumentTextobjA
  omap <silent> i, <Plug>SidewaysArgumentTextobjI
  xmap <silent> i, <Plug>SidewaysArgumentTextobjI
endif

if dein#tap('splitjoin.vim')
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
		if &l:modifiable && &buftype ==# '' && &filetype !=# 'gitrebase'
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

""""""""""""
"  kraxli  "
""""""""""""

if dein#tap('iron.nvim')
	nmap <silent> <Leader>rr :<C-u>IronRepl<CR><Esc><C-W>R	" exe "vertical resize " . (winwidth(0) * 2/3)
	nmap <silent> <Leader>rq <Plug>(iron-exit)
	nmap <silent> <Leader>rs <Plug>(iron-send-line)
	vmap <silent> <Leader>rs <Plug>(iron-visual-send)
	" nmap <silent> <F5> <Plug>(iron-send-line)		" <F9>
	" vmap <silent> <F5> <Plug>(iron-visual-send)	" <F9>
	nmap <silent> <Leader>rp <Plug>(iron-repeat-cmd)
	nmap <silent> <Leader>rc <Plug>(iron-clear)
	nmap <silent> <Leader>r<CR>  <Plug>(iron-cr)
	nmap <silent> <Leader>r<Esc> <Plug>(iron-interrupt)

	" function! ReplOrientation(...)
	" 	IronRepl
	" 	normal <C-W>r
	" endfunction
	"
	" command! IronReplRight call ReplOrientation()
endif


if dein#tap('vista.vim')
	nnoremap <silent> <Leader>b :<C-u>Vista<CR>
	nnoremap <silent> <Leader>a :<C-u>Vista show<CR>
endif


if dein#tap('sniprun')
	nmap <leader>w <Plug>SnipRun  " w for watch
	vmap <leader>w <Plug>SnipRun
	nmap <F6> <Plug>SnipRun
	vmap <F6> <Plug>SnipRun
endif

if dein#tap('nvim-dap')
	nnoremap <silent> <F9> :lua require'dap'.continue()<CR>
	nnoremap <silent> <leader>dd :lua require('dap').continue()<CR>
	nnoremap <silent> <F7> :lua require'dap'.step_over()<CR>
	" nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
	nnoremap <silent> <F12> :lua require'dap'.step_into()<CR>
	nnoremap <silent> <space><F12> :lua require'dap'.step_out()<CR>
	" nnoremap <silent> <F10> :lua require'dap'.toggle_breakpoint()<CR>
	nnoremap <silent> <F8> :lua require'dap'.toggle_breakpoint()<CR>
	nnoremap <silent> <space><F8> :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
	nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
	nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
	nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
	nnoremap <silent> <leader>dr :lua require'dap'.repl.toggle()<CR>
	nnoremap <silent> <leader>dl :lua require'dap'.repl.run_last()<CR>`
	nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
	vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

	au FileType dap-repl lua require('dap.ext.autocompl').attach()
endif

if dein#tap('nvim-dap-ui')
  " nnoremap <silent> <leader>dr :lua require("dapui").toggle()<CR>
  nnoremap <silent> <leader>db :lua require("dapui").toggle()<CR>
endif

" vim: set ts=2 sw=2 tw=80 noet :
