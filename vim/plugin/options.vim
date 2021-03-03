" =========================================================
" ==================== Option settings ====================
" =========================================================
set autoread                               " automatically reload files changed outside vim
set autowriteall                           " automatically save files
set backspace=indent,eol,start             " make backspace work properly
set cursorline                             " highlight current line
set hidden                                 " allow buffer switching without saving
set history=100                            " store more command history
set hlsearch                               " highlight all matches
set ignorecase                             " case insensitive search
set inccommand=split                       " shows the effects of a command incrementally, as you type
set incsearch                              " search incrementally instead of after pressing enter
set laststatus=2                           " turn on status line
set lazyredraw                             " reduce the redraw frequency - make macros render faster (lazy draw)
set linebreak                              " ensure the whole word is going to the next virtual line
set list listchars=eol:↲,tab:»·,trail:·    " Set icons to visually indicate special characters (i.e. eol, space, tab, trail)
set noswapfile                             " disable swap files
set number                                 " display line number
set pastetoggle=<F2>                       " Toggle pastemode to avoid unexpected effects when pasting
set path+=**                               " set find command to look for sub directories recursively
set redrawtime=5000                        " Prevent huge files from breaking (and disabling) syntax highlighting
set relativenumber                         " display line number relative to the current one
set shell=/usr/bin/bash                    " Set bash as vim shell (it speeds up vim-fugitive A LOT)
set shortmess+=c                           " show completion suggestions (^X) in insert mode
set showbreak=>>                           " virtual line indicator
set showcmd                                " show incomplete cmds down the bottom
set showmatch                              " show bracket matches
set smartcase                              " case sensitive if we type an uppercase
set timeoutlen=1000 ttimeoutlen=0          " remove timeout when hitting escape
set ttyfast                                " send more characters in fast terminals
set undolevels=400                         " store a bunch of undo history
set viewoptions=folds,options,cursor,unix  " improve Unix/Windows compatibility
set visualbell                             " enable visual bell (disable audio bell)
set wildignorecase                         " enable case-insensitive while completing file names
set wildmenu                               " Tab autocomplete in command mode
set wrap                                   " this enables 'visual' wrapping

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


