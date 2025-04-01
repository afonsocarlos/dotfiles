--------------------------------------------------------
---------------------- Key mappings --------------------
--------------------------------------------------------
local M = {}

local default_opts = { noremap = true, silent = true }

-- Ease window navigation
vim.keymap.set("n", "<C-j>", "<C-W>j", { remap = true })
vim.keymap.set("n", "<C-k>", "<C-W>k", { remap = true })
vim.keymap.set("n", "<C-h>", "<C-W>h", { remap = true })
vim.keymap.set("n", "<C-l>", "<C-W>l", { remap = true })
-- Add spelling correction
vim.keymap.set("n", "gz", "[s1z=``")
-- Resize with arrows
vim.keymap.set("n", "<C-S-Up>", ":resize -5<CR>", default_opts)
vim.keymap.set("n", "<C-S-Down>", ":resize +5<CR>", default_opts)
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -5<CR>", default_opts)
vim.keymap.set("n", "<C-S-Right>", ":vertical resize +5<CR>", default_opts)

vim.keymap.set("n", "<leader>e", ":e<CR>:echo 'File reloaded!'<CR>", default_opts)
vim.keymap.set("n", "<leader>n", ":enew<CR>", default_opts)
vim.keymap.set("n", "<leader>s", ":update<CR>", default_opts)
-- Write file without trailing whitespaces
vim.keymap.set("n", "<leader>w", ":noa w<CR>", default_opts)
-- Make file executable
vim.keymap.set("n", "<leader>X", ":silent ![[ -x % ]] && chmod -x % || chmod +x %<CR>:echo 'File stat: ' . getfperm(expand('%'))<CR>", default_opts)
-- Close buffer
vim.keymap.set("n", "<leader>db", ":bdel!<CR>", default_opts)
vim.keymap.set("n", "<leader>dd", ":Bdel<CR>", default_opts)
vim.keymap.set("n", "<leader>df", ":Bdel!<CR>", default_opts)
vim.keymap.set("n", "<leader>da", ":Bdel #<CR>", default_opts)
vim.keymap.set("n", "<leader>dt", ":tabclose<CR>", default_opts)
-- Toggle spell check
vim.keymap.set("n", "<F5>", ":setlocal spell! spelllang=pt_br<CR>")
vim.keymap.set("n", "<F6>", ":setlocal spell! spelllang=en_us<CR>")
vim.keymap.set("n", "<F7>", ":setlocal spell! spelllang=fr<CR>")
vim.keymap.set("i", "<F5>", "<C-o>:setlocal spell! spelllang=pt_br<CR>")
vim.keymap.set("i", "<F6>", "<C-o>:setlocal spell! spelllang=en_us<CR>")
vim.keymap.set("i", "<F7>", "<C-o>:setlocal spell! spelllang=fr<CR>")
--[[" toggle Vista
nnoremap <F9> :Vista!!<CR>
" toggle Goyo (distraction free)
nnoremap <F11> :Goyo<CR>
--]]

-- Shortcut for vertically aligning elements with Easy Align
vim.keymap.set("n", "gA", "ga")
vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { remap = true })
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { remap = true })

-- yank from the cursor to the end of the line, to be consistent with C and D
vim.keymap.set("n", "Y", "y$")
-- Quit All windows without checking for changes
vim.keymap.set("n", "ZQ", ":qa!<CR>", default_opts)
-- Insert new line in normal mode
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")
vim.keymap.set("n", "gco", "o.<Esc>gcc$C", { remap = true })
vim.keymap.set("n", "gcO", "O.<Esc>gcc$C", { remap = true })
-- Enable better scrolling
vim.keymap.set("n", "<C-e>", "3<C-e>")
vim.keymap.set("n", "<C-y>", "3<C-y>")
-- Hide hightlights on Esc
vim.keymap.set("n", "<Esc>", ":nohl<Esc>", default_opts)

-- Paste without adding deleted text into the unamed register
-- Enable ve=onemore to handle the special case of pasting/replacing last word at the end of line
vim.keymap.set("x", "<leader>p", ":<C-U>set virtualedit+=onemore<CR>gv\"_dP:set virtualedit-=onemore<CR>")

-- Simple way to copy to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y", { remap = true })
vim.keymap.set("n", "<leader>y<C-G>", ":<C-U>call setreg('+', expand('%'))<CR>", default_opts)

vim.keymap.set("v", "<leader>_", ":<C-U>keeppatterns '<,'>s/\\%V[ -]/_/g<CR>", default_opts)
vim.keymap.set("v", "<leader>cr", " <Plug>(abolish-coerce)", { remap = true })

-- vim-slime map
vim.keymap.set("x", "<M-cr>", "<Plug>SlimeRegionSend")
vim.keymap.set("n", "<M-cr>", "<Plug>SlimeParagraphSend")
vim.keymap.set("n", "<C-c>v", "<Plug>SlimeConfig")

-- ************* NvimTree *************
vim.keymap.set("n", "<leader>k", "expand('%:p') != '' && bufwinnr('NvimTree') != 1 ? ':NvimTreeFindFile<CR>' : ':NvimTreeToggle<CR>'", { expr = true, silent = true })

-- ************* Undotree *************
vim.keymap.set("n", "<leader>u", ":UndotreeToggle | UndotreeFocus<CR>", default_opts)

-- ************* Symbol-outline *************
vim.keymap.set("n", "<F8>", ":SymbolsOutline<CR>", default_opts)

-- ************* TreeSJ *************
vim.keymap.set("n", "<leader>m", ":TSJToggle<CR>", default_opts)
return M
