local luasnip

return {

  "L3MON4D3/LuaSnip",                     -- snippet engine
  version = "2.*",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
  dependencies = {
    "saadparwaiz1/cmp_luasnip",           -- for autocompletion
    -------------- check these --------------
    "rafamadriz/friendly-snippets",       -- useful snippets
    "honza/vim-snippets",
    -------------- check these --------------
  },
  config = function()
    luasnip = require("luasnip")
    local types = require("luasnip.util.types")

    luasnip.config.set_config({
      history = true,

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
    -- require("luasnip.loaders.from_snipmate").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load { paths = vim.fn.stdpath "config" .. "/lua/afonsocarlos/snippets/" }
  end,
  keys = {
    -- <c-j> is my expansion key
    -- this will expand the current item or jump to the next item within the snippet.
    {
      "<c-j>",
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

    -- <c-l> is selecting within a list of options.
    -- This is useful for choice nodes (introduced in the forthcoming episode 2)
    {
      "<c-l>",
      function()
        if not luasnip.choice_active() then return "<c-g>u<Esc>[s1z=`]a<c-g>u" end
        vim.schedule(function() luasnip.change_choice(1) end)
        return "<Ignore>"
      end,
      mode = { "i", "s" },
      silent = true,
      expr = true,
    },
  },
}
