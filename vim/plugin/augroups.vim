" ========================================================
" ==================== Autocmd groups ====================
" ========================================================
" Set foldmethod to syntax, but enable to create manual foldings
augroup twofoldings
    autocmd!

    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup end

augroup numbertoggle
    autocmd!

    autocmd BufEnter,FocusGained * set relativenumber
    autocmd BufLeave,FocusLost   * set norelativenumber
augroup end

" Show trailing white space as red
augroup treat_trailing_whitespace
    autocmd!

    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

    " automatically remove trailing white space
    autocmd BufWritePre * call StripTrailingWhitespace()
augroup end

" autoreload file when edited out of vim
augroup refresh_screen
    autocmd!

    autocmd CursorHold,CursorHoldI * checktime
    autocmd FocusGained,BufEnter * :checktime
augroup end

" guten tags already does this, but leave it here just for precaution
" autocmd BufWritePost *.c, *.cpp, *.h, *.js, *.php, *.py silent! !ctags -R &

" Convenient mappings for compiling and running quick, used mostly for school
" gcc compile C files
augroup autorun
    " clear autocmds defined in this group (i.e. resource .vimrc)
    autocmd!

    autocmd FileType c nnoremap <Leader>c :w <CR>:!gcc % -o %:r -lm && ./%:r<CR>
    " g++ compile C++ files
    autocmd FileType cpp nnoremap <Leader>c :w <CR>:!g++ % -o %:r && ./%:r<CR>
    " java compile files
    autocmd FileType java nnoremap <Leader>c :w <CR>:!javac % && java %:r<CR>
    " node run files
    autocmd FileType javascript nnoremap <Leader>c :w <CR>:!node %<CR>
    " python run files
    autocmd FileType python nnoremap <Leader>c :w <CR>:!python3 %<CR>
augroup end

" enable free distraction mode
augroup markdown
    autocmd!

    " Beautify Markdown Editing
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!

    autocmd FileType fugitive,git,gitcommit,markdown set completefunc=emoji#complete | call Emoji_apply_conceal()


    " Make Livedown work properly
    if !has('nvim')
      autocmd FileType markdown
          \ autocmd! BufWritePost <buffer> LivedownPreview
    endif
augroup end

augroup vimwikigroup
    autocmd!

    " Improve syntax
    autocmd FileType vimwiki set syntax=markdown

    " Remappings
    autocmd FileType markdown nnoremap <buffer><leader>w/ :VWS //<Left>
    autocmd FileType markdown inoremap <expr><buffer><C-n> vimwiki#tbl#kbd_tab()
    autocmd FileType markdown inoremap <expr><buffer><C-p> vimwiki#tbl#kbd_shift_tab()

    " Automate diary organization
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks

    " Sync local vimwiki with Remote git server
    autocmd VimEnter,BufRead ~/wiki/index.md execute 'Dispatch! cd <afile>:p:h; git pull'
    autocmd BufLeave ~/wiki/* if expand('<afile>') !~ 'index.md' | execute 'Dispatch! cd <afile>:p:h; git add <afile>:t; git commit -m "Update <afile>:s?wiki/??"'
    autocmd VimLeave * execute 'Dispatch! git push'
augroup end

" NeoVim specific Plugins
if has('nvim')
    augroup NCM2
        autocmd!

        " enable ncm2 for all buffers
        autocmd BufEnter * call ncm2#enable_for_buffer()

        " IMPORTANT: :help Ncm2PopupOpen for more information
        set completeopt=noinsert,menuone,noselect

        let g:ncm2#matcher = 'substrfuzzy'

        " Press enter key to trigger snippet expansion
        " The parameters are the same as `:help feedkeys()`
        inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>\<C-R>=AutoPairsReturn()<CR>", 'n')
    augroup end
endif

