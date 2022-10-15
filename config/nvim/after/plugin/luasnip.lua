local luasnip = require "luasnip"
local types = require "luasnip.util.types"

luasnip.config.set_config {
  history = true,

  update_events = "TextChanged,TextChangedI",

  -- enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
