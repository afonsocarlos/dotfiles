" ==================================================
" ==================== Settings ====================
" ==================================================

" ************* vim-airline settings *************
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ************* onedark.vim settings *************
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
"
" ************* FZF settings *************
" Open fzf in a floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Function' } }

" ************* VimWiki settings *************
let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = ' ○◐●x'
let g:vimwiki_folding = 'list'
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_table_mappings = 0
let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 1
" let g:vimwiki_toc_link_format = 1

" ************* vim-checkbox settings *************
let g:insert_checkbox_prefix = '- '
" Remove default mapping
silent! unmap <leader>tt

" ************* Startify settings *************
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
    \ { 'header': ['   Commands'],                     'type': 'commands',       },
    \ { 'header': ['   Files'],                        'type': 'files' },
    \ { 'header': ['   Current Directory '. getcwd()], 'type': 'dir' },
    \ { 'header': ['   Sessions'],                     'type': 'sessions' },
    \ { 'header': ['   Bookmarks'],                    'type': 'bookmarks',       },
    \ ]
let g:startify_bookmarks = [ {'c': resolve(expand('~/.vimrc'))}, '~/.zshrc' ]
let g:startify_commands = [
    \ {'o': ['Start saving session (Obsess)', ':Obsess']},
    \ {'u': ['Upgrade vim-plug and Install and Update plugins', ':PlugUpgrade | :PlugInstall | :PlugUpdate']},
    \ ]

" ************* Ememt settings *************
let g:user_emmet_leader_key = '<C-z>'

" ************* PHP refactoring settings *************
let g:php_refactor_command = 'php /usr/local/bin/refactor.phar'

" ************* Golden Ratio settings *************
let g:golden_ratio_autocommand = 0

" ************* Vista settings *************
let g:vista_default_executive = 'coc'
let g:vista_cursor_delay = 100
let g:vista_echo_cursor_strategy = 'scroll'
let g:vista_update_on_text_changed = 1
let g:vista_close_on_jump = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_executive_for = {
    \ 'vim': 'ctags',
\ }

" ************* Obsession settings *************
set statusline+=%{ObsessionStatus()}

" ************* Scratch settings *************
let g:scratch_filetype = 'vimwiki'
let g:scratch_persistence_file = '~/wiki/Scratchpad.md'

" ************* SuperTab settings *************
let g:SuperTabDefaultCompletionType = '<C-n>'

" NeoVim specific Plugins
if has('nvim')
    " ************* gen_tags settings *************
    let g:gen_tags#ctags_auto_gen = 1

    " ************* Neomake settings *************
    " Full config: when writing or reading a buffer, and on changes in insert and
    " normal mode (after 1s; no delay when writing).
    call neomake#configure#automake('nrwi', 500)

    " ************* Ncm2 float-preview settings *************
    let g:float_preview#docked = 1

    " ************* telescope settings *************
    lua require'carlos.telescope'

" VIM specific Plugins
else
    " ************* syntastic settings *************
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_error_symbol = "✗"
    let g:syntastic_warning_symbol = "⚠"
    let g:syntastic_always_populate_loc_list = 1  " Make syntastic work with :lnext and :lprev
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_pylint_args = "--load-plugins pylint_django"

    " ************* Youcompleteme settings *************
    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_collect_identifiers_from_tags_files = 0
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
endif

" ************* Custom Snippets *************
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "customsnippets"]

" ************* Targets *************
autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'b': {'pair': [{'o':'(', 'c':')'}]}
    \ })

