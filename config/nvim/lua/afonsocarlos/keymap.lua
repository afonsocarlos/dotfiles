--------------------------------------------------------
---------------------- Key mappings --------------------
--------------------------------------------------------
local M = {}

M.nmap = bind("n", { remap = true })
M.xmap = bind("x", { remap = true })

M.noremap = { noremap = true }
M.silent = { silent = true }
M.default_opts = { noremap = true, silent = true }

-- Ease window navigation
vim.keymap.set("", "<C-j>", "<C-W>j", { remap = true })
vim.keymap.set("", "<C-k>", "<C-W>k", { remap = true })
vim.keymap.set("", "<C-h>", "<C-W>h", { remap = true })
vim.keymap.set("", "<C-l>", "<C-W>l", { remap = true })


vim.keymap.set("n", "<leader>e", ":e<CR>:echo 'File reloaded!'<CR>", M.default_opts)
vim.keymap.set("n", "<leader>n", ":enew<CR>", M.default_opts)
vim.keymap.set("n", "<leader>s", ":update<CR>", M.noremap)
-- Write file without trailing whitespaces
vim.keymap.set("n", "<leader>w", ":noa w<CR>", M.noremap)
-- Close buffer
vim.keymap.set("n", "<leader>db", ":Bdel<CR>", M.default_opts)
vim.keymap.set("n", "<leader>dd", ":Bdel!<CR>", M.default_opts)
vim.keymap.set("n", "<leader>de", ":Bdel #<CR>", M.default_opts)
-- Toggle spell check
vim.keymap.set("n", "<F6>", ":setlocal spell! spelllang=en_us<CR>", M.noremap)
vim.keymap.set("n", "<F5>", ":setlocal spell! spelllang=pt_br<CR>", M.noremap)
vim.keymap.set("i", "<F6>", "<C-o>:setlocal spell! spelllang=en_us<CR>", M.noremap)
vim.keymap.set("i", "<F5>", "<C-o>:setlocal spell! spelllang=pt_br<CR>", M.noremap)
--[[" toggle Tagbar
nnoremap <F8> :TagbarToggle<CR>
" toggle Vista
nnoremap <F9> :Vista!!<CR>
" toggle Goyo (distraction free)
nnoremap <F11> :Goyo<CR>
--]]

-- Shortcut for vertically aligning elements with Easy Align
vim.keymap.set("n", "gA", "ga", M.noremap)
vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { remap = true })
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { remap = true })

-- yank from the cursor to the end of the line, to be consistent with C and D
vim.keymap.set("n", "Y", "y$", M.noremap)
-- Quit All windows without checking for changes
vim.keymap.set("n", "ZQ", ":qa!<CR>", M.default_opts)
-- Insert new line in normal mode
vim.keymap.set("n", "<leader>o", "o<Esc>", M.noremap)
vim.keymap.set("n", "<leader>O", "O<Esc>", M.noremap)
-- Enable better scrolling
vim.keymap.set("n", "<C-e>", "3<C-e>", M.noremap)
vim.keymap.set("n", "<C-y>", "3<C-y>", M.noremap)
-- Hide hightlights on Esc
vim.keymap.set("n", "<Esc>", ":nohl<Esc>", M.default_opts)

-- Go to next/prev buffer in buffer list
vim.keymap.set("n", "[b", ":bp<CR>", M.default_opts)
vim.keymap.set("n", "]b", ":bn<CR>", M.default_opts)
vim.keymap.set("n", "[B", ":bfirst<CR>", M.default_opts)
vim.keymap.set("n", "]B", ":blast<CR>", M.default_opts)
-- Go to next/prev item in location list
vim.keymap.set("n", "[l", ":lprev<CR>", M.default_opts)
vim.keymap.set("n", "]l", ":lnext<CR>", M.default_opts)
vim.keymap.set("n", "[L", ":lfirst<CR>", M.default_opts)
vim.keymap.set("n", "]L", ":llast<CR>", M.default_opts)
-- Go to next/prev item in quick list
vim.keymap.set("n", "[q", ":cprev<CR>", M.default_opts)
vim.keymap.set("n", "]q", ":cnext<CR>", M.default_opts)
vim.keymap.set("n", "[Q", ":cfirst<CR>", M.default_opts)
vim.keymap.set("n", "]Q", ":clast<CR>", M.default_opts)

-- ************* NvimTree *************
vim.keymap.set("n", "<leader>k", ":NvimTreeFindFile<CR>", M.default_opts)

-- ************* Undotree *************
vim.keymap.set("n", "<leader>u", ":UndotreeShow | UndotreeFocus<CR>", M.default_opts)

return M
