local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  actions             = {
    open_file = {
      resize_window = true
    }
  },
  disable_netrw       = false,
  hijack_cursor       = false,
  hijack_directories  = {
    enable = true
  },
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
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
  renderer = {
    add_trailing = true,
    highlight_opened_files = "icon"
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  view = {
    width = 30,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {
        { key = "<C-k>", cb = tree_cb("prev_sibling") },
        { key = "<C-j>", cb = tree_cb("next_sibling") },
        { key = "<C-i>", cb = tree_cb("toggle_file_info") },
        { key = "<C-h>", cb = tree_cb("toggle_dotfiles") },
        { key = "H", action = "" },
      }
    }
  },
  filters = {
    dotfiles = true,
    custom = {'__pycache__', 'env/', '.cache'}
  }
}
