local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
  ["<C-k>"] = tree_cb("prev_sibling"),
  ["<C-j>"] = tree_cb("next_sibling"),
}
