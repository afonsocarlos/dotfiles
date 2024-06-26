local M = {}

M.setup = function()
  local ts_input = require("mini.surround").gen_spec.input.treesitter
  require("mini.surround").setup({
    custom_surroundings = {
      f = {
        input = ts_input({ outer = "@call.outer", inner = "@call.inner" }),
      },
    },
    mappings = {
      add = "ys",
      delete = "ds",
      find = "",
      find_left = "",
      highlight = "",
      replace = "cs",
      update_n_lines = "",

      -- Add this only if you don't want to use extended mappings
      suffix_last = "l",
      suffix_next = "n",
    },
    respect_selection_type = true,

    search_method = "cover_or_next",
  })

  vim.keymap.del("x", "ys")

  vim.keymap.set("n", "csw", "ysiw", { remap = true })
  vim.keymap.set("n", "csW", "ysiW", { remap = true })
  -- Remap adding surrounding to Visual mode selection
  vim.keymap.set("x", "S", ":<C-u>lua MiniSurround.add('visual')<CR>", { silent = true })
  -- Make special mapping for "add surrounding for line"
  vim.keymap.set("n", "yss", "ys<cmd>normal vg_o^<CR>", { remap = true })
end

return M
