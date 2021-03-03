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

  Plug 'wellle/targets.vim'

  " file fuzzy search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'vimwiki/vimwiki'
  Plug 'mattn/calendar-vim'
  Plug 'mzlogin/vim-markdown-toc'
  Plug 'vim-scripts/utl.vim'
  Plug 'jkramer/vim-checkbox'

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

  " toggle comments
  Plug 'tpope/vim-commentary'

  " Asynchronous build and test dispatcher
  Plug 'tpope/vim-dispatch'

  " git integration for Vim
  Plug 'tpope/vim-fugitive'

  " continuously updated session files
  Plug 'tpope/vim-obsession'

  " repeat last modification regarding to Plugin editions
  Plug 'tpope/vim-repeat'

  " parentheses, brackets, quotes, html tags surrounding plugin
  Plug 'tpope/vim-surround'

  Plug 'sheerun/vim-polyglot'

  Plug 'ryanoasis/vim-devicons'

  Plug 'dart-lang/dart-vim-plugin'

  " PHP refactoring plugin
  Plug 'vim-php/vim-php-refactoring'

  Plug 'mtth/scratch.vim'

  " Turn vim into a REPL editor
  Plug 'jpalardy/vim-slime'

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

" ************* vim-slime settings *************
let g:slime_target = 'tmux'
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}







" ================================================================
" ==================== Personal Customization ====================
" ================================================================
" turn on syntax highlighting
syntax on
" and set onedark as colorscheme
colorscheme onedark
" enable plugin TODO: edit this comment to a better explanation
filetype plugin on


" Special highlighting settings
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
highlight Comment cterm=italic gui=italic







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
