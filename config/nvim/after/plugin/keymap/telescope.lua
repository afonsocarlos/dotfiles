local builtin = require "telescope.builtin"
local nnoremap = require("afonsocarlos.keymap").nnoremap

-- ************* Telescope *************
nnoremap("<leader>fa", builtin.grep_string)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fc", builtin.commands)
nnoremap("<leader>fd", builtin.diagnostics)
nnoremap("<leader>ff", builtin.find_files)
nnoremap("<leader>fg", builtin.live_grep)
nnoremap("<leader>fh", builtin.help_tags)
nnoremap("<leader>fl", builtin.current_buffer_fuzzy_find)
