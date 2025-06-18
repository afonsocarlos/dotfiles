local selection = {
  selection = {
    preselect = false,
    auto_insert = true,
  },
}

return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "moyiz/blink-emoji.nvim",
  },
  version = "1.*",
  opts = {
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    cmdline = {
      enabled = true,
      completion = {
        list = selection,
        menu = { auto_show = true },
      },
      keymap = {
        ["<Right>"] = { "fallback" },
        ["<Left>"] = { "fallback" },
      },
      sources = function()
        if vim.fn.getcmdtype() == ":" then return { "cmdline", "path" } end
        return {}
      end
    },

    completion = {
      documentation = { auto_show = true },
      list = selection
    },

    keymap = {
      ["<C-K>"] = {},
    },

    signature = { enabled = true },

    snippets = { preset = "luasnip" },

    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer", "emoji" },
      per_filetype = {
        sql = { "snippets", "dadbod", "buffer" },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        emoji = {
          name = "Emoji",
          module = "blink-emoji",
          score_offset = 15,
          should_show_items = function()
            return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
          end,
        },
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
      },
    },
  },
}
