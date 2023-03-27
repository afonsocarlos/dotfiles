local builtin = require "telescope.builtin"

-- ************* Telescope *************
vim.keymap.set("n", "<leader>fa", builtin.grep_string)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fc", builtin.commands)
vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>fl", builtin.current_buffer_fuzzy_find)
