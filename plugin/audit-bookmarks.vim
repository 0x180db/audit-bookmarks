" Vim plug-in
" Author: Ricky Flim <0x180db@gmail.com>
" Last Change: June 9, 2023
" URL: https://github.com/0x180db/audit-bookmarks

" Make sure the plug-in is only loaded once.
if exists('g:loaded_audit_bookmarks')
  finish
endif
let g:loaded_audit_bookmarks = 1

augroup auditBookmarks
  autocmd!
  " @audit - (red) General bookmark for potential issues.
  autocmd Syntax * syntax match auditBookmarks /@audit/ containedin=.*Comment
  " @audit-info - (blue) General bookmark for information to be noted for later use.
  autocmd Syntax * syntax match auditBookmarksInfo /@audit-info/ containedin=.*Comment
  " @audit-ok - (green) Add a note that a specific line is not an issue even though it might look like.
  autocmd Syntax * syntax match auditBookmarksOk /@audit-ok/ containedin=.*Comment
  " @audit-issue - (purple) Reference a code location an issue was filed for.
  autocmd Syntax * syntax match auditBookmarksIssue /@audit-issue/ containedin=.*Comment
augroup END

highlight link auditBookmarks Error
highlight link auditBookmarksInfo SpellLocal
highlight link auditBookmarksOk StatusLineTermNC
highlight link auditBookmarksIssue DiffText
