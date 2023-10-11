-- Out of the box LSP features even without language server
return {
  "nvimtools/none-ls.nvim",               -- configure formatters & linters
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    require("mason-null-ls").setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua",   -- lua formatter
        "black",    -- python formatter
        "pylint",   -- python linter
        "eslint_d", -- js linter
      },
    })

    -- to setup format on save
    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- configure null_ls
    null_ls.setup({
      root_dir = require("null-ls.utils").root_pattern(".git", ".null-ls-root", "Makefile", "composer.json", "package.json"),
      -- setup formatters & linters
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua, -- lua formatter
        null_ls.builtins.formatting.pint,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.eslint_d.with({                        -- js/ts linter
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
          end,
        }),
      },
      -- configure format on save
      -- on_attach = function(current_client, bufnr)
      --   if current_client.supports_method("textDocument/formatting") then
      --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       group = augroup,
      --       buffer = bufnr,
      --       callback = function()
      --         vim.lsp.buf.format({
      --           filter = function(client)
      --             --  only use null-ls for formatting instead of lsp server
      --             return client.name == "null-ls"
      --           end,
      --           bufnr = bufnr,
      --         })
      --       end,
      --     })
      --   end
      -- end,
    })
  end,
}
