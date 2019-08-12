

if g:environment==?'home'
  let g:vimwiki_list = [
  \   { 'diary_header': 'Diary',
  \     'diary_link_fmt': '%Y-%m/%d',
  \     'auto_toc': 1,
  \     'path': '~/Dropbox/PKD/vimwiki/',
  \     'syntax': 'markdown',
  \     'ext': '.md' },
  \   { 'path': '~/Dropbox/docs/blog/',
  \     'syntax': 'markdown',
  \     'ext': '.md' }
  \ ]
elseif g:environment==?'work'
  let g:vimwiki_list = [
  \   { 'diary_header': 'Diary',
  \     'diary_link_fmt': '%Y-%m/%d',
  \     'auto_toc': 1,
  \     'path': '~/vimwiki/',
  \     'syntax': 'markdown',
  \     'ext': '.md' },
  \   { 'path': '~/docs/blog/',
  \     'syntax': 'markdown',
  \     'ext': '.md' }
  \ ]
endif


