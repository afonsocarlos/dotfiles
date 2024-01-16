" =========================================================
" ==================== Custom commands ====================
" =========================================================
" Format SQL queries
command! -range SQLFormat execute "<line1>,<line2>!python3 -m sqlparse --reindent --keywords upper -"

" Grep TODO across multiple files from (maybe) specified directories
command! -nargs=? -complete=file TodoList grep -R '\b(TODO\|FIXME)\b' <args>
" Remove '-R' option if grepprg is rg
if executable('rg')
    command! -nargs=? -complete=file TodoList grep '\b(TODO\|FIXME)\b' <args>
endif

command! -nargs=? -bar -bang -complete=customlist,startify#session_list SSave
  \ call startify#session_save(<bang>0, <f-args>) |
  \ if !empty(v:this_session) |
  \   execute "Obsession " . v:this_session |
  \ endif
