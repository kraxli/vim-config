" File Types
" ---

augroup user_plugin_filetype " {{{
	autocmd!

	" Reload vim configuration automatically on-save
	autocmd BufWritePost $VIM_PATH/{*.vim,*.yaml,vimrc} nested
		\ source $MYVIMRC | redraw

	" Highlight current line only on focused window, unless:
	" 1. Cursor-line is already set to wanted value
	" 2. Denite or Clap buffers
	" 3. Preview window
	" 4. Completion popup menu is visible
	autocmd WinEnter,BufEnter,InsertLeave *
		\ if ! &cursorline && &filetype !~# '^\(denite\|clap_\|.*quickpick\)'
		\      && ! &previewwindow && ! pumvisible()
		\ | setlocal cursorline
		\ | endif
	autocmd WinLeave,BufLeave,InsertEnter *
		\ if &cursorline && &filetype !~# '^\(denite\|clap_\|.*quickpick\)'
		\      && ! &previewwindow && ! pumvisible()
		\ | setlocal nocursorline
		\ | endif

	" Automatically set read-only for files being edited elsewhere
	autocmd SwapExists * nested let v:swapchoice = 'o'

	" Update diff comparison once leaving insert mode
	autocmd InsertLeave * if &l:diff | diffupdate | endif

	" Equalize window dimensions when resizing vim window
	autocmd VimResized * wincmd =

	" Force write shada on leaving nvim
	autocmd VimLeave * if has('nvim') | wshada! | else | wviminfo! | endif

	" Check if file changed when its window is focus, more eager than 'autoread'
	autocmd FocusGained * checktime

	autocmd Syntax * if line('$') > 5000 | syntax sync minlines=200 | endif

	" Neovim terminal settings
	if has('nvim-0.5')
		autocmd TermOpen * setlocal modifiable
		try
			autocmd TextYankPost *
				\ silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
		endtry
	endif

	" Update filetype on save if empty
	autocmd BufWritePost * nested
		\ if &l:filetype ==# '' || exists('b:ftdetect')
		\ |   unlet! b:ftdetect
		\ |   filetype detect
		\ | endif

	" Reload Vim script automatically if setlocal autoread
	autocmd BufWritePost,FileWritePost *.vim nested
		\ if &l:autoread > 0 | source <afile> |
		\   echo 'source ' . bufname('%') |
		\ endif

	" When editing a file, always jump to the last known cursor position.
	" Credits: https://github.com/farmergreg/vim-lastplace
	autocmd BufReadPost *
		\ if index(['gitcommit', 'gitrebase', 'svn', 'hgcommit'], &buftype) == -1 &&
		\      index(['quickfix', 'nofile', 'help'], &buftype) == -1 &&
		\      ! &diff && ! &previewwindow &&
		\      line("'\"") > 0 && line("'\"") <= line("$")
		\|   if line("w$") == line("$")
		\|     execute "normal! g`\""
		\|   elseif line("$") - line("'\"") > ((line("w$") - line("w0")) / 2) - 1
		\|     execute "normal! g`\"zz"
		\|   else
		\|     execute "normal! \G'\"\<c-e>"
		\|   endif
		\|   if foldclosed('.') != -1
		\|     execute 'normal! zvzz'
		\|   endif
		\| endif

	autocmd FileType apache setlocal path+=./;/

	autocmd FileType html setlocal path+=./;/

	autocmd FileType crontab setlocal nobackup nowritebackup

	autocmd FileType yaml.docker-compose setlocal expandtab

	autocmd FileType gitcommit setlocal spell

	autocmd FileType gitcommit,qfreplace setlocal nofoldenable

	" https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
	autocmd FileType css,javascript,javascriptreact setlocal backupcopy=yes

	autocmd FileType php
		\ setlocal matchpairs-=<:> iskeyword+=\\ " path+=/usr/local/share/pear
	"		\ | setlocal formatoptions=qroct " Correct indent after opening a phpdocblock

	autocmd FileType python
		\ setlocal expandtab smarttab nosmartindent
		\ | setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 wrap

	autocmd FileType html setlocal path+=./;/

	autocmd FileType markdown,vimwiki,text,mkdx,vimwiki.markdown,markdown.vimwiki
		\ setlocal expandtab smarttab
		\ | setlocal tabstop=2 softtabstop=2 shiftwidth=2
		\ | setlocal autoindent
		"\ | setl formatoptions=tcoq2  " do not set "r" (list indentation) when using mkdx  rafi: formatoptions=tcroqn2 comments=n:>
		"\ | setlocal comments=b:*,b:-,b:+,b:>,n:>,se:``` commentstring=>\ %s  " do not use with mkdx
		\ | setl formatoptions=tcroqn2 comments=n:>
		\ | setl formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*[+-\\*]\\s\\+
		\ | setl wrap linebreak nolist
		\ | setl breakindent
		\ | setl textwidth=0
		\ | setl wrapmargin=0 " only used when textwidth=0
		\ | setlocal nolisp
		\ | setl spell spelllang=en,de
		\ | setlocal foldlevel=1 foldenable foldmethod=expr
		\ | setlocal foldexpr=fold#FoldLevelOfLine(v:lnum)
		\ | setlocal conceallevel=0

		" \ | setl iskeyword-=-,\-		" used for mkdx to insert new list items & do not highlight '-' as cursorword
		" autocmd FileType markdown set filetype=vimwiki
		"\ | au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown

		" au BufNewFile,BufRead,BufFilePost,BufWinEnter *.mkdx,*.md,*.markdown let g:mkdx#settings = { 'enter': { 'shift': 0 } }
		" set breakat
		" \ | setl formatoptions=tcroqn2 / tron
		" \ setlocal conceallevel=0 " not complient with indentLine

	" https://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
	autocmd FileType css,javascript,javascriptreact setlocal backupcopy=yes

	autocmd FileType cam setlocal nonumber synmaxcol=10000

	" autocmd FileType go highlight default link goErr WarningMsg |
	"	\ match goErr /\<err\>/

	" autocmd! FileType defx,nofile IndentGuidesDisable
	" autocmd! BufEnter,WinEnter defx,nofile IndentGuidesDisable

	au FileType yaml,toml setl nospell

	au FileType matlab setl foldmethod=indent nospell


augroup END " }}}



" Internal Plugin Settings  {{{
" ------------------------

" PHP {{{
let g:PHP_removeCRwhenUnix = 0

" }}}
" Python {{{
let g:python_recommended_style = 0
let g:pydoc_executable = 0
" let g:python_highlight_all = 1
" let g:python_highlight_builtins = 1
" let g:python_highlight_exceptions = 1
" let g:python_highlight_string_format = 1
" let g:python_highlight_doctests = 1
" let g:python_highlight_class_vars = 1
" let g:python_highlight_operators = 1

" }}}
" Vim {{{
let g:vimsyntax_noerror = 1
let g:vim_indent_cont = &shiftwidth

" }}}
" Bash {{{
let g:is_bash = 1
let g:sh_no_error = 1

" }}}
" Java {{{
let g:java_highlight_functions = 'style'
let g:java_highlight_all = 1
let g:java_highlight_debug = 1
let g:java_allow_cpp_keywords = 1
let g:java_space_errors = 1
let g:java_highlight_functions = 1

" }}}
" JavaScript {{{
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" }}}
" Ruby {{{
let g:ruby_no_expensive = 1
" }}}

" Folding {{{
" augroup: a
" function: f
let g:vimsyn_folding = 'af'
let g:tex_fold_enabled = 1
let g:xml_syntax_folding = 1
let g:php_folding = 2
let g:php_phpdoc_folding = 1
let g:perl_fold = 1
" }}}
" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
