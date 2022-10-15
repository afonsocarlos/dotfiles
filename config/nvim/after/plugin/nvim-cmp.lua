local cmp = require "cmp"

cmp.setup({
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<C-y>"] = cmp.mapping.confirm({
      -- behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "cmp_git" },
    { name = "luasnip" }, -- For luasnip users.
    -- { name = "ultisnips" }, -- For ultisnips users.
    { name = "buffer", keyword_length = 5 },
  }),

  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },

  formatting = {
    format = require("lspkind").cmp_format({
      mode = "symbol_text", -- show only symbol annotations
      preset = "codicons",
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      symbol_map = {
        Text = "",
        Method = "ƒ",
        Function = "",
        Constructor = "",
        Variable = "",
        Class = "",
        Interface = "ﰮ",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "了",
        Keyword = "",
        Snippet = "﬌",
        Color = "",
        File = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = ""
      },

      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
        cmp_git = "[git]",
      },

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        -- ...
        return vim_item
      end
    })
  },

  experimental = {
    ghost_text = true,
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline("/", {
--   sources = {
--     { name = "buffer" }
--   }
-- })

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
--   sources = cmp.config.sources({
--     { name = "path" }
--   }, {
--     { name = "cmdline" }
--   })
-- })

require("cmp_git").setup()
