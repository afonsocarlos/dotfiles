local default_opts = require("afonsocarlos.keymap").default_opts

return {
  'stevearc/oil.nvim',
  opts = {
    columns = {
      "icon",
      "permissions",
      "size",
    },
    keymaps = {
      ["<leader>-"] = "actions.close",
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        local always_hidden = {
          [".git"] = true,
        }
        return always_hidden[name]
      end,
    }
  },
  keys = {
    { "<leader>-", "<CMD>Oil<CR>", mode = "n", default_opts }
  }
}
