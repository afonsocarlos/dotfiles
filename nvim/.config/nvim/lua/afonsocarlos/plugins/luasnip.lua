local luasnip

return {

  "L3MON4D3/LuaSnip", -- snippet engine
  version = "2.*",
  build = "make install_jsregexp",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
  dependencies = {
    -------------- check these --------------
    "rafamadriz/friendly-snippets",       -- useful snippets
    "honza/vim-snippets",
    -------------- check these --------------
  },
  config = function()
    luasnip = require("luasnip")
    local types = require("luasnip.util.types")

    luasnip.config.set_config({
      keep_roots = false,
      link_roots = false,
      link_children = false,
      exit_roots = true,

      update_events = "TextChanged,TextChangedI",

      -- enable_autosnippets = true,

      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { " « ", "Error" } },
          },
        },
      },
    })

    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/afonsocarlos/snippets/" })
  end,
  keys = {
    -- <c-h> is my expansion key
    -- this will expand the current item or jump to the next item within the snippet.
    {
      "<c-h>",
      function()
        return luasnip.jumpable(1) and luasnip.jump(1) or luasnip.expand_or_jump()
      end,
      mode = { "i", "s" },
      silent = true,
    },

    -- <c-k> is my jump backwards key.
    -- this always moves to the previous item within the snippet
    {
      "<c-k>",
      function()
        if not luasnip.jumpable(-1) then return "<c-k>" end
        vim.schedule(function() luasnip.jump(-1) end)
        return "<Ignore>"
      end,
      mode = { "i", "s" },
      silent = true,
      expr = true,
    },

    -- <c-j> is selecting within a list of options.
    -- This is useful for choice nodes
    {
      "<c-j>",
      function()
        return luasnip.choice_active() and luasnip.change_choice(1)
      end,
      mode = { "i", "s" },
      silent = true,
    },
  },
}
