

if has('unix')
  let g:vimwiki_list = [
  \   { 'diary_header': 'Diary',
  \     'diary_link_fmt': '%Y-%m/%d',
  \     'auto_toc': 1,
  \     'path': '~/Dropbox/vimwiki/',
  \     'syntax': 'markdown',
  \     'ext': '.md' },
  \   { 'path': '~/Dropbox/docs/blog/',
  \     'syntax': 'markdown',
  \     'ext': '.md' }
  \ ]
else
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


