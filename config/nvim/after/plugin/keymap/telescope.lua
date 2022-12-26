local builtin = require "telescope.builtin"
local noremap = require("afonsocarlos.keymap").noremap

-- ************* Telescope *************
vim.keymap.set("n", "<leader>fa", builtin.grep_string, noremap)
vim.keymap.set("n", "<leader>fb", builtin.buffers, noremap)
vim.keymap.set("n", "<leader>fc", builtin.commands, noremap)
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, noremap)
vim.keymap.set("n", "<leader>ff", builtin.find_files, noremap)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, noremap)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, noremap)
vim.keymap.set("n", "<leader>fl", builtin.current_buffer_fuzzy_find, noremap)
