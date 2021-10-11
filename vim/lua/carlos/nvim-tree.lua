local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
  { key = '<C-k>', cb = tree_cb('prev_sibling') },
  { key = '<C-j>', cb = tree_cb('next_sibling') },
}
