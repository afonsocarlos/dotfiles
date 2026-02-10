vim.opt.autoread = true                                         -- automatically reload files changed outside vim
vim.opt.autowriteall = true                                     -- automatically save files
vim.opt.backspace = { "indent", "eol", "start" }                -- make backspace work properly
vim.opt.conceallevel = 2                                        -- Replace or hide text with conceal syntax
vim.opt.cursorline = true                                       -- highlight current line
vim.opt.diffopt:append "vertical"                               -- options settings for diff mode
vim.opt.hidden = true                                           -- allow buffer switching without saving
vim.opt.history = 100                                           -- store more command history
vim.opt.hlsearch = true                                         -- highlight all matches
vim.opt.ignorecase = true                                       -- case insensitive search
vim.opt.inccommand = "split"                                    -- interactive :substitute
vim.opt.incsearch = true                                        -- search incrementally instead of after pressing enter
vim.opt.laststatus = 3                                          -- turn on status line
vim.opt.lazyredraw = true                                       -- reduce the redraw frequency - make macros render faster (lazy draw)
vim.opt.linebreak = true                                        -- ensure the whole word is going to the next virtual line
vim.opt.list = true
vim.opt.listchars = "eol:↲,tab:»·,trail:·"                      -- Set icons to visually indicate special characters (i.e. eol, space, tab, trail)
vim.opt.matchtime = 1
vim.opt.mouse = ""                                              -- Disable mouse
vim.opt.number = true                                           -- display line number
vim.opt.path:append "**"                                        -- set find command to look for sub directories recursively
vim.opt.redrawtime = 5000                                       -- Prevent huge files from breaking (and disabling) syntax highlighting
vim.opt.relativenumber = true                                   -- display line number relative to the current one
vim.opt.selection = "old"                                       -- Keep selection inclusive but doesn't allow the cursor to be positioned one character past the line.
vim.opt.shell = "/usr/bin/bash"                                 -- Set bash as vim shell (it speeds up vim-fugitive A LOT)
vim.opt.shortmess:append "cS"                                   -- show completion suggestions (^X) in insert mode and hide Search count
vim.opt.showbreak = ">>"                                        -- virtual line indicator
vim.opt.showcmd = true                                          -- show incomplete cmds down the bottom
vim.opt.showmatch = true                                        -- show bracket matches
vim.opt.smartcase = true                                        -- case sensitive if we type an uppercase
vim.opt.splitbelow = true                                       -- put new windows always below
vim.opt.splitright = true                                       -- put new windows always below
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0                                         -- remove timeout when hitting escape
vim.opt.ttyfast = true                                          -- send more characters in fast terminals
vim.opt.undolevels = 400                                        -- store a bunch of undo history
vim.opt.updatetime = 50                                         -- make updates happen faster
vim.opt.viewoptions = { "folds", "options", "cursor", "unix" }  -- improve Unix/Windows compatibility
vim.opt.virtualedit = { "block" }                               -- enable visual bell (disable audio bell)
vim.opt.visualbell = true                                       -- enable visual bell (disable audio bell)
vim.opt.wildignorecase = true                                   -- enable case-insensitive while completing file names
vim.opt.wildmenu = true                                         -- Tab autocomplete in command mode
vim.opt.winborder = "rounded"                                   -- Give all floating windows rounded borders by default
vim.opt.wrap = true                                             -- this enables 'visual' wrapping


-- this turns off physical line wrapping
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

vim.opt.swapfile = false                                          -- disable swap files
vim.opt.backup = false                                            -- disable backup
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"  -- setup undo directory
vim.opt.undofile = true                                           -- enable undo files

-- Indentation options
vim.opt.expandtab = true    -- on pressing tab, insert 4 spaces
vim.opt.shiftwidth = 4      -- when indenting '>', use 4 spaces width
vim.opt.tabstop = 4         -- show existing tab with 4 spaces width
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Folding options
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- set file encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "latin1" }

-- set file EOL
vim.opt.fileformat = "unix"
vim.opt.fileformats = { "unix", "dos" }


-- Use Silver Searcher if available
if vim.fn.executable "ag" then
    -- Use ag over grep
    vim.opt.grepprg = "ag --nogroup --nocolor"
end

-- Use Ripgrep if available
-- (Ag was preferred but it has an inconvenient problem of not respecting
-- .gitignore files from subdirectories which annoyed me)
if vim.fn.executable "rg" then
    -- Use rg over grep
    vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end
