--------------------------------------------------------
---------------------- Key mappings --------------------
--------------------------------------------------------
local nmap = require("afonsocarlos.keymap").nnoremap
local xmap = require("afonsocarlos.keymap").nnoremap
local nnoremap = require("afonsocarlos.keymap").nnoremap
local inoremap = require("afonsocarlos.keymap").inoremap

-- Ease window navigation
vim.keymap.set("", "<C-j>", "<C-W>j", { remap = true })
vim.keymap.set("", "<C-k>", "<C-W>k", { remap = true })
vim.keymap.set("", "<C-h>", "<C-W>h", { remap = true })
vim.keymap.set("", "<C-l>", "<C-W>l", { remap = true })


nnoremap("<leader>e", ":e<CR>:echo 'File reloaded!'<CR>", { silent = true })
nnoremap("<leader>n", ":enew<CR>")
nnoremap("<leader>s", ":update<CR>")
nnoremap("<leader>s", ":update<CR>")
-- Write file without trailing whitespaces
nnoremap("<leader>w", ":noa w<CR>")
-- Close buffer
nnoremap("<leader>db", ":Bdel<CR>")
nnoremap("<leader>dd", ":Bdel!<CR>")
nnoremap("<leader>de", ":Bdel #<CR>")
-- Toggle spell check
nnoremap("<F6>", ":setlocal spell! spelllang=en_us<CR>")
nnoremap("<F5>", ":setlocal spell! spelllang=pt_br<CR>")
inoremap("<F6>", "<C-o>:setlocal spell! spelllang=en_us<CR>")
inoremap("<F5>", "<C-o>:setlocal spell! spelllang=pt_br<CR>")
--[[" toggle Tagbar
nnoremap <F8> :TagbarToggle<CR>
" toggle Vista
nnoremap <F9> :Vista!!<CR>
" toggle Goyo (distraction free)
nnoremap <F11> :Goyo<CR>
--]]

-- Shortcut for vertically aligning elements with Easy Align
nnoremap("gA", "ga")
xmap("ga", "<Plug>(EasyAlign)")
nmap("ga", "<Plug>(EasyAlign)")

-- yank from the cursor to the end of the line, to be consistent with C and D
nnoremap("Y", "y$")
-- Quit All windows without checking for changes
nnoremap("ZQ", ":qa!<CR>", { silent = true })
-- Insert new line in normal mode
nnoremap("<leader>o", "o<Esc>")
nnoremap("<leader>O", "O<Esc>")
-- Enable better scrolling
nnoremap("<C-e>", "3<C-e>")
nnoremap("<C-y>", "3<C-y>")
-- Hide hightlights on Esc
nnoremap("<Esc>", ":nohl<Esc>")

-- Go to next/prev buffer in buffer list
nnoremap("[b", ":bp<CR>", { silent = true })
nnoremap("]b", ":bn<CR>", { silent = true })
nnoremap("[B", ":bfirst<CR>", { silent = true })
nnoremap("]B", ":blast<CR>", { silent = true })
-- Go to next/prev item in location list
nnoremap("[l", ":lprev<CR>", { silent = true })
nnoremap("]l", ":lnext<CR>", { silent = true })
nnoremap("[L", ":lfirst<CR>", { silent = true })
nnoremap("]L", ":llast<CR>", { silent = true })
-- Go to next/prev item in quick list
nnoremap("[q", ":cprev<CR>", { silent = true })
nnoremap("]q", ":cnext<CR>", { silent = true })
nnoremap("[Q", ":cfirst<CR>", { silent = true })
nnoremap("]Q", ":clast<CR>", { silent = true })

-- ************* NvimTree *************
nnoremap("<leader>k", ":NvimTreeFindFile<CR>", { silent = true })

-- ************* Undotree *************
nnoremap("<leader>u", ":UndotreeShow | UndotreeFocus<CR>", { silent = true })

