local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  disable_netrw       = false,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = true,
  diagnostics         = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  view = {
    width = 30,
    height = 30,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "<C-k>", cb = tree_cb("prev_sibling") },
        { key = "<C-j>", cb = tree_cb("next_sibling") },
      }
    }
  },
  filters = {
    dotfiles = true,
    custom = {'__pycache__', 'env', '.cache'}
  }
}
