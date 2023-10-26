--------------------------------------------------------
---------------------- Key mappings --------------------
--------------------------------------------------------
local M = {}

M.default_opts = { noremap = true, silent = true }

-- Ease window navigation
vim.keymap.set("", "<C-j>", "<C-W>j", { remap = true })
vim.keymap.set("", "<C-k>", "<C-W>k", { remap = true })
vim.keymap.set("", "<C-h>", "<C-W>h", { remap = true })
vim.keymap.set("", "<C-l>", "<C-W>l", { remap = true })
vim.keymap.set("", "<M-,>", "<C-W><", { remap = true })
vim.keymap.set("", "<M-.>", "<C-W>>", { remap = true })


vim.keymap.set("n", "<leader>e", ":e<CR>:echo 'File reloaded!'<CR>", M.default_opts)
vim.keymap.set("n", "<leader>n", ":enew<CR>", M.default_opts)
vim.keymap.set("n", "<leader>s", ":update<CR>")
-- Write file without trailing whitespaces
vim.keymap.set("n", "<leader>w", ":noa w<CR>")
-- Make file executable
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>:echo 'File is now executable!'<CR>", M.default_opts)
-- Close buffer
vim.keymap.set("n", "<leader>db", ":Bdel<CR>", M.default_opts)
vim.keymap.set("n", "<leader>dd", ":Bdel!<CR>", M.default_opts)
vim.keymap.set("n", "<leader>de", ":Bdel #<CR>", M.default_opts)
vim.keymap.set("n", "<leader>dt", ":tabclose<CR>", M.default_opts)
-- Toggle spell check
vim.keymap.set("n", "<F6>", ":setlocal spell! spelllang=en_us<CR>")
vim.keymap.set("n", "<F5>", ":setlocal spell! spelllang=pt_br<CR>")
vim.keymap.set("i", "<F6>", "<C-o>:setlocal spell! spelllang=en_us<CR>")
vim.keymap.set("i", "<F5>", "<C-o>:setlocal spell! spelllang=pt_br<CR>")
--[[" toggle Tagbar
nnoremap <F8> :TagbarToggle<CR>
" toggle Vista
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
vim.keymap.set("n", "ZQ", ":qa!<CR>", M.default_opts)
-- Insert new line in normal mode
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")
-- Enable better scrolling
vim.keymap.set("n", "<C-e>", "3<C-e>")
vim.keymap.set("n", "<C-y>", "3<C-y>")
-- Hide hightlights on Esc
vim.keymap.set("n", "<Esc>", ":nohl<Esc>", M.default_opts)

-- fugitive Shortcuts
vim.keymap.set("n", "<leader>gs", ":G<CR>", M.default_opts)
vim.keymap.set("n", "<leader>gl", ":G pull<CR>", M.default_opts)
vim.keymap.set("n", "<leader>gp", ":G push<CR>", M.default_opts)

-- Delete without adding deleted text into the register
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("x", "<leader>d", "\"_d")

-- Simple way to copy to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Go to next/prev buffer in buffer list
vim.keymap.set("n", "[b", ":<C-U>exe v:count.'bp'<CR>", M.default_opts)
vim.keymap.set("n", "]b", ":<C-U>exe v:count.'bn'<CR>", M.default_opts)
vim.keymap.set("n", "[B", ":bfirst<CR>", M.default_opts)
vim.keymap.set("n", "]B", ":blast<CR>", M.default_opts)
-- Go to next/prev item in location list
vim.keymap.set("n", "[l", ":<C-U>exe v:count.'lprev'<CR>zz", M.default_opts)
vim.keymap.set("n", "]l", ":<C-U>exe v:count.'lnext'<CR>zz", M.default_opts)
vim.keymap.set("n", "[L", ":lfirst<CR>zz", M.default_opts)
vim.keymap.set("n", "]L", ":llast<CR>zz", M.default_opts)
-- Go to next/prev item in quick list
vim.keymap.set("n", "[q", ":<C-U>exe v:count.'cprev'<CR>zz", M.default_opts)
vim.keymap.set("n", "]q", ":<C-U>exe v:count.'cnext'<CR>zz", M.default_opts)
vim.keymap.set("n", "[Q", ":cfirst<CR>zz", M.default_opts)
vim.keymap.set("n", "]Q", ":clast<CR>zz", M.default_opts)
-- vim-slime map
vim.keymap.set("x", "<M-cr>", "<Plug>SlimeRegionSend")
vim.keymap.set("n", "<M-cr>", "<Plug>SlimeParagraphSend")
vim.keymap.set("n", "<C-c>v", "<Plug>SlimeConfig")

-- ************* NvimTree *************
vim.keymap.set("n", "<leader>k", "expand('%:p') != '' && bufwinnr('NvimTree') != 1 ? ':NvimTreeFindFile<CR>' : ':NvimTreeToggle<CR>'", { expr = true, silent = true })

-- ************* Undotree *************
vim.keymap.set("n", "<leader>u", ":UndotreeToggle | UndotreeFocus<CR>", M.default_opts)

-- ************* Symbol-outline *************
vim.keymap.set("n", "<F8>", ":SymbolsOutline<CR>", M.default_opts)

-- ************* TreeSJ *************
vim.keymap.set("n", "<leader>m", ":TSJToggle<CR>", M.default_opts)
return M
