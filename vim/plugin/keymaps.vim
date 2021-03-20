" ======================================================
" ==================== Key mappings ====================
" ======================================================
let mapleader = ' '
" ease window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Add spelling correction
inoremap <C-l> <Esc>[s1z=egi

" switch buffers
" Magic buffer-picking mode
nnoremap <silent><leader>bb :BufferLinePick<CR>
" Sort automatically by...
nnoremap <silent> <leader>bd :lua require'bufferline'.sort_buffers_by('directory')<CR>
nnoremap <silent> <leader>be :lua require'bufferline'.sort_buffers_by('extension')<CR>
" Move to previous/next
nnoremap <silent><C-n> :BufferLineCycleNext<CR>
nnoremap <silent><C-p> :BufferLineCyclePrev<CR>
" Re-order to previous/next
nnoremap <silent><M-C-N> :BufferLineMoveNext<CR>
nnoremap <silent><M-C-P> :BufferLineMovePrev<CR>

nnoremap <silent> <leader>e :e<CR>:echo 'File reloaded!'<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>s :update<CR>
" Write file without trailing whitespaces
nnoremap <leader>w :let b:noStripWhitespace=1 <BAR> :w<CR>
" Close buffer
nnoremap <leader>db :Bdel<CR>
nnoremap <leader>dd :Bdel!<CR>
nnoremap <leader>de :Bdel #<CR>
" toggle spell check
nnoremap <F6> :setlocal spell! spelllang=en_us<CR>
nnoremap <F5> :setlocal spell! spelllang=pt_br<CR>
inoremap <F6> <C-o>:setlocal spell! spelllang=en_us<CR>
inoremap <F5> <C-o>:setlocal spell! spelllang=pt_br<CR>
" toggle Tagbar
nnoremap <F8> :TagbarToggle<CR>
" toggle Vista
nnoremap <F9> :Vista!!<CR>
" toggle Goyo (distraction free)
nnoremap <F11> :Goyo<CR>
" shortcut for vertically aligning elements with Easy Align
nnoremap gA ga
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" toggle nerd tree
nnoremap <silent> <expr> <leader>k expand('%:p') != '' && bufwinnr("NERD_tree") != 1 ? ':NERDTreeFind<CR>' : ':NERDTreeToggle<CR>'
" toggle Scratch
nnoremap <leader>t :Scratch<CR>
" toggle checkbox
noremap <silent><leader>gt :call checkbox#ToggleCB()<CR>
" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$
" insert new line in normal mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
" enable better scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" Hide hightlights on Esc
nnoremap <leader>q :nohl<Esc>
" select which tag to inspect when there's multiple
nnoremap <C-]> g<C-]>
" fugitive shortcuts
nnoremap <leader>gs :G<CR>
nnoremap <leader>gl :G pull<CR>
nnoremap <leader>gm :G checkout master<CR>
nnoremap <leader>gp :G push<CR>
" go to next/prev item in location list
nnoremap <silent> [l :lprev<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>
" go to next/prev item in quick list
nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" vim-slime map
xmap <m-cr> <Plug>SlimeRegionSend
nmap <m-cr> <Plug>SlimeParagraphSend
nmap <c-c>v <Plug>SlimeConfig
" coc shortcuts
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
" Apply AutoFix to problem on the current line.
xmap <silent><leader>a  <Plug>(coc-codeaction-selected)
nmap <silent><leader>a  <Plug>(coc-codeaction-selected)

" Remap <C-j> and <C-k> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-W>j"
  nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-W>k"
  inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<C-j>"
  inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<C-k>"
  vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-W>j"
  vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-W>k"
endif

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


if has('nvim')
  nnoremap <leader>fa <cmd>Telescope grep_string<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fl <cmd>Telescope current_buffer_fuzzy_find<cr>
else
  " open fzf for files, buffers, and vim-help
  nnoremap <leader>fa :Ag<CR>
  nnoremap <leader>ff :Files<CR>
  nnoremap <leader>fb :Buffers<CR>
  nnoremap <leader>fh :Helptags<CR>
endif
