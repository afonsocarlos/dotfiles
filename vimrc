"  __     __ _
"  \ \   / /(_) _ __ ___   _ __  ___
"   \ \ / / | || '_ ` _ \ | '__|/ __|
"   _\ V /  | || | | | | || |  | (__
"  (_)\_/   |_||_| |_| |_||_|   \___|
"
" Use Vim settings, rather than vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Vim-plug autoinstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Youcompleteme autoinstall
if !empty(glob('.vim/plugged/youcompleteme')) && empty(glob('.vim/plugged/youcompleteme/third_party/ycmd/clang_archives'))
  silent !git -C ~/.vim/plugged/youcompleteme submodule update --init --recursive
  silent !~/.vim/plugged/youcompleteme/install.py --clang-completer --js-completer || echo 'Ensure you have run sudo apt-get install build-essential cmake python-dev python3-dev'
endif

" =================================================
" ==================== Plugins ====================
" =================================================
call plug#begin('~/.vim/plugged')

  " Colorscheme/theme
  Plug 'joshdick/onedark.vim'
  " Fancy status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Fancy start screen
  Plug 'mhinz/vim-startify'

  " NERDTree file explorer
  Plug 'scrooloose/nerdtree'
  " NERDTree git integration
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Ease html coding like a breeze
  Plug 'mattn/emmet-vim'

  " Close html tags
  Plug 'docunext/closetag.vim'

  " Git gutter for vim
  Plug 'airblade/vim-gitgutter'

  " for learning to master vim the hard way...
  " Plug 'wikitopian/hardmode'

  " cross text-editor config standards
  Plug 'editorconfig/editorconfig-vim'

  " parentheses, brackets, quotes, html tags surrounding plugin
  Plug 'tpope/vim-surround'

  Plug 'wellle/targets.vim'

  " file fuzzy search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'vimwiki/vimwiki'
  Plug 'mattn/calendar-vim'
  Plug 'mzlogin/vim-markdown-toc'
  Plug 'vim-scripts/utl.vim'

  " count and index matches in a search
  Plug 'google/vim-searchindex'

  " display ctag description (when completing)
  Plug 'majutsushi/tagbar'

  " Use release branch (recommend)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Coc Extensions to install coc-marketplace

  " View and search LSP symbols, tags in Vim/NeoVim
  Plug 'liuchengxu/vista.vim'

  " automatically open/close quotes and brackets
  Plug 'jiangmiao/auto-pairs'

  " generate tags automatically
  " Plug 'ludovicchabant/vim-gutentags'
  Plug 'jsfaint/gen_tags.vim'

  " toggle comments
  Plug 'tpope/vim-commentary'

  " resize windows neatly!
  Plug 'roman/golden-ratio'

  " highlight hex, rgb and colornames
  Plug 'chrisbra/colorizer'

  " php completion
  Plug 'shawncplus/phpcomplete.vim'

  " tabular - vertically align elements
  Plug 'godlygeek/tabular'

  " Easy Align - vertically align elements
  Plug 'junegunn/vim-easy-align'

  " Vim snippets
  Plug 'SirVer/ultisnips'
  " Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'

  " Handle what tab will do, (like triggering Ultisnips or Youcompleteme i.e.)
  Plug 'ervandew/supertab'

  " intelligent substitution
  Plug 'tpope/vim-abolish'

  " repeat last modification regarding to Plugin editions
  Plug 'tpope/vim-repeat'

  " git integration for Vim
  Plug 'tpope/vim-fugitive'

  " continuously updated session files
  Plug 'tpope/vim-obsession'

  " Asynchronous build and test dispatcher
  Plug 'tpope/vim-dispatch'

  Plug 'sheerun/vim-polyglot'

  Plug 'ryanoasis/vim-devicons'

  " PHP refactoring plugin
  Plug 'vim-php/vim-php-refactoring'

  Plug 'mtth/scratch.vim'

" ######################## MARKDOWN CONFIG ########################
  " fold rules for markdown
  Plug 'nelstrom/vim-markdown-folding'

  " plugin for 'writing in prose' mode
  Plug 'reedes/vim-pencil'

  " plugin for identifying words and phrases misuse, abuse, and overuse
  Plug 'reedes/vim-wordy'

  " Distraction free plugin
  Plug 'junegunn/goyo.vim'

  " dim paragraphs, but current one, to enhance focus
  Plug 'junegunn/limelight.vim'

  " markdown preview
  " Plug 'suan/vim-instant-markdown'
  Plug 'shime/vim-livedown'

  " Emoji in Vim
  Plug 'junegunn/vim-emoji'


  " VIM specific Plugins
  if !has('nvim')
      " lint code like a charm
      Plug 'scrooloose/syntastic'

      " languages auto completion
      Plug 'valloric/youcompleteme'
  endif


  " NeoVim specific Plugins
  if has('nvim')
      " lint code like a charm for neovim
      Plug 'neomake/neomake'

      Plug 'phpactor/phpactor',  {'do': 'composer install -d ~/.vim/plugged/phpactor', 'for': 'php'}

      Plug 'ncm2/ncm2'
      Plug 'roxma/nvim-yarp'
      Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
      Plug 'phpactor/ncm2-phpactor'
      Plug 'ncm2/ncm2-jedi'
      Plug 'ncm2/ncm2-ultisnips'
      Plug 'ncm2/float-preview.nvim'

      " nvim markdown preview
      Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

  endif

call plug#end()

" load the version of matchit.vim that ships with vim
runtime macros/matchit.vim

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
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
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

" VIM specific Plugins
if !has('nvim')
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

" ************* SuperTab settings *************
let g:SuperTabDefaultCompletionType = '<C-n>'

" ************* Scratch settings *************
let g:scratch_filetype = 'vimwiki'
let g:scratch_persistence_file = '~/wiki/Scratchpad.md'

" NeoVim specific Plugins
if has('nvim')
    " ************* gen_tags settings *************
    let g:gen_tags#ctags_auto_gen = 1
    let g:gen_tags#gtags_auto_gen = 1

    " ************* Neomake settings *************
    " Full config: when writing or reading a buffer, and on changes in insert and
    " normal mode (after 1s; no delay when writing).
    call neomake#configure#automake('nrwi', 500)

    " ************* Ncm2 float-preview settings *************
    let g:float_preview#docked = 1
endif

" ************* Custom Snippets *************
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "customsnippets"]

" ************* Targets *************
autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'b': {'pair': [{'o':'(', 'c':')'}]}
    \ })


" ======================================================
" ==================== Key mappings ====================
" ======================================================
map <space> \
" ease window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Add spelling correction
inoremap <C-l> <Esc>[s1z=egi

" switch buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <silent> <leader>e :e<CR>:echo 'File reloaded!'<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>s :update<CR>
" Write file without trailing whitespaces
nnoremap <leader>w :let b:noStripWhitespace=1 <BAR> :w<CR>
nnoremap <leader>d :bdel<CR>
nnoremap <leader>dd :bdel!<CR>
nnoremap <leader>de :bdel #<CR>
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
" shortcut for vertically aligning elements
nnoremap <leader>a= :Tab /=<CR>
vnoremap <leader>a= :Tab /=<CR>
" shortcut for vertically aligning elements with Easy Align
nnoremap gA ga
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" toggle nerd tree
nnoremap <silent> <expr> <leader>k expand('%:p') != '' && bufwinnr("NERD_tree") != 1 ? ':NERDTreeFind<CR>' : ':NERDTreeToggle<CR>'
" toggle Scratch
nnoremap <leader>t :Scratch<CR>
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
" open fzf for files, buffers, and vim-help
nnoremap <leader>a :Ag<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :Helptags<CR>
" fugitive shortcuts
nnoremap <leader>gs :G<CR>
nnoremap <leader>gl :G pull<CR>
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
" coc shortcuts
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

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


" ================================================================
" ==================== Personal Customization ====================
" ================================================================
" turn on syntax highlighting
syntax on
" and set onedark as colorscheme
colorscheme onedark
" enable plugin TODO: edit this comment to a better explanation
filetype plugin on

set autoread                               " automatically reload files changed outside vim
set autowriteall                           " automatically save files
set backspace=indent,eol,start             " make backspace work properly
set cursorline                             " highlight current line
set hidden                                 " allow buffer switching without saving
set history=100                            " store more command history
set hlsearch                               " highlight all matches
set ignorecase                             " case insensitive search
set incsearch                              " search incrementally instead of after pressing enter
set laststatus=2                           " turn on status line
set linebreak                              " ensure the whole word is going to the next virtual line
set list listchars=tab:»·,trail:·
set noswapfile                             " disable swap files
set number                                 " display line number
set path+=**                               " set find command to look for sub directories recursively
set relativenumber                         " display line number relative to the current one
set lazyredraw                             " reduce the redraw frequency - make macros render faster (lazy draw)
set redrawtime=5000                        " Prevent huge files from breaking (and disabling) syntax highlighting
set ttyfast                                " send more characters in fast terminals
set showbreak=>>                           " virtual line indicator
set showcmd                                " show incomplete cmds down the bottom
set showmatch                              " show bracket matches
set smartcase                              " case sensitive if we type an uppercase
set undolevels=400                         " store a bunch of undo history
set viewoptions=folds,options,cursor,unix  " improve Unix/Windows compatibility
set visualbell                             " enable visual bell (disable audio bell)
set wildignorecase                         " enable case-insensitive while completing file names
set wildmenu                               " Tab autocomplete in command mode
set wrap                                   " this enables 'visual' wrapping
set timeoutlen=1000 ttimeoutlen=0          " remove timeout when hitting escape
set shortmess+=c                           " show completion suggestions (^X) in insert mode
set pastetoggle=<F2>                       " Toggle pastemode to avoid unexpected effects when pasting
set inccommand=split                       " shows the effects of a command incrementally, as you type

" this turns off physical line wrapping
set textwidth=0
set wrapmargin=0

" Indentation options
set expandtab     " on pressing tab, insert 4 spaces
set shiftwidth=4  " when indenting '>', use 4 spaces width
set tabstop=4     " show existing tab with 4 spaces width
set autoindent
set smartindent

" Folding options
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" set file encoding
set encoding=utf-8
set fileencodings=utf-8,latin1

" set file EOL
set fileformat=unix
set fileformats=unix,dos

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
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


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
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
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

    autocmd FileType fugitive,git,gitcommit,markdown set completefunc=emoji#complete
    autocmd BufReadPost *.md call Emoji_apply_conceal()


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

" Use Silver Searcher if available
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif

" Use Ripgrep if available
" (Ag was preferred but it has an inconvenient problem of not respecting
" .gitignore files from subdirectories which annoyed me)
if executable('rg')
    " Use rg over grep
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif


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


" =========================================================
" ==================== Custom commands ====================
" =========================================================
" Format SQL queries
command! -range SQLFormat execute "<line1>,<line2>!python3 -m sqlparse --reindent --keywords upper -"

" Grep TODO across multiple files from (maybe) specified directories
command! -nargs=? -complete=file TodoList grep -R '\b(TODO\|FIXME)\b' <args>


" ================================================================
" ===================== C Specific Settings ======================
" ================================================================
augroup c_customcommentstring
    autocmd!

    autocmd FileType c setlocal commentstring=//%s
    autocmd FileType cpp setlocal commentstring=//%s
augroup end


" ================================================================
" ============= Dart Specific Settings (for Flutter) =============
" ================================================================
augroup flutter_setup
    autocmd!

    autocmd FileType dart UltiSnipsAddFiletypes dart-flutter
augroup end


" ================================================================
" ==================== PHP Specific Settings =====================
" ================================================================
" let php_folding=1
let php_sql_query = 1
let php_htmlInStrings = 1
augroup php_customcommentstring
    autocmd!

    autocmd FileType php,php-laravel setlocal commentstring=//%s
    autocmd FileType smarty setlocal commentstring={*%s*}
augroup end
augroup laravel_setup
    autocmd!

    " this one is which you're most likely to use?
    autocmd FileType php UltiSnipsAddFiletypes php-laravel
augroup end
augroup php_docs
    autocmd!

    " this one is which you're most likely to use?
    autocmd FileType php setlocal keywordprg=~/.vim/docs/php
augroup end
