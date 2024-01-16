" ============================================================
" ==================== Personal Functions ====================
" ============================================================

" support emoji concealing.
" Credits to vim-emoji,
" me,
" @rhysd at https://github.com/rhysd/vim-gfm-syntax/commit/7cee65d73a7ff451b3cef8a48a9b2e032a471217
" And @christian-brabandt at https://vi.stackexchange.com/a/5698
function! Emoji_apply_conceal()
    setlocal conceallevel=2
    for e in emoji#list()
        call matchadd('Conceal', ':'.e.':', 10, -1, {'conceal': ''.emoji#for(e)})
    endfor
endfunction

" Credits to @jamessan at https://stackoverflow.com/a/6496995/6634981
" And vimcasts http://vimcasts.org/episodes/tidying-whitespace/
function! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" ************* functions for Coc shortcuts *************
function! functions#check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! functions#show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
