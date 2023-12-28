local config_hipatterns = function ()
  local hipatterns = require('mini.hipatterns')
  hipatterns.setup({
    highlighters = {
      hex_color = hipatterns.gen_highlighter.hex_color(),
      fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
      hack  = { pattern = 'HACK',  group = 'MiniHipatternsHack'  },
      todo  = { pattern = 'TODO',  group = 'MiniHipatternsTodo'  },
      note  = { pattern = 'NOTE',  group = 'MiniHipatternsNote'  },
    }
  })
end

local config_indentscope = function()
  require("mini.indentscope").setup({})
end

local config_surround = function()
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
end

return {
  "echasnovski/mini.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    config_surround()
    config_indentscope()
    config_hipatterns()
  end,
  keys = {
    { "csw", "ysiw", remap = true },
    { "csW", "ysiW", remap = true },
    -- Remap adding surrounding to Visual mode selection
    { "S", ":<C-u>lua MiniSurround.add('visual')<CR>", mode = "x", silent = true }, -- Make special mapping for "add surrounding for line"
    { "yss", "ys_", remap = true },
  },
}