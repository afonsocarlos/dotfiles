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
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        menu = { auto_show = true },
      },
    },

    completion = {
      documentation = { auto_show = true },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      }
    },

    signature = { enabled = true },

    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer", "emoji" },
      -- :smile:
      per_filetype = {
        sql = { "snippets", "dadbod", "buffer" },
      },
      providers = {
        buffer = {
          opts = {
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ""
              end, vim.api.nvim_list_bufs())
            end,
          },
        },
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        -- :sweat_smile:
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert emoji (default) or complete its name
          -- should_show_items = function()
          --   return vim.tbl_contains(
          --     -- Enable emoji completion only for git commits and markdown.
          --     -- By default, enabled for all file-types.
          --     { "gitcommit", "markdown" },
          --     vim.o.filetype
          --   )
          -- end,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
  },
}
