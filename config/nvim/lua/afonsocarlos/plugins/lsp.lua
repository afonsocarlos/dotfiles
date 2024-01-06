return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "ray-x/lsp_signature.nvim",
    -- A better annotation generator
    { "danymat/neogen", opts = { snippet_engine = "luasnip" } },
  },
  config = function()
    local folding = require "folding"
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local navic = require "nvim-navic"

    local servers = {
      intelephense = {},
      pyright = {},
      lua_ls = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          diagnostics = {
            globals = { "vim" },
          },
          format = { enable = true },
          telemetry = { enable = false },
          workspace = { checkThirdParty = true },
        }
      },

    }

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }
    local installed_servers = mason_lspconfig.get_installed_servers()

    -- Loop through the installed servers and set them up
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    for _, server_name in ipairs(installed_servers) do
      lspconfig[server_name].setup({
        settings = servers[server_name],
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end

          folding.on_attach()

          -- Add some fancy integration
          local setup_lsp_highlight = vim.api.nvim_create_augroup("setup_lsp_highlight", { clear = true })
          if client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd("CursorHold", {
              group = setup_lsp_highlight,
              buffer = bufnr,
              callback = vim.lsp.buf.document_highlight
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              group = setup_lsp_highlight,
              buffer = bufnr,
              callback = vim.lsp.buf.clear_references
            })
          end
        end
      })
    end

    lspconfig.phpactor.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.completionProvider = false
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.implementationProvider = false
        client.server_capabilities.referencesProvider = false
        client.server_capabilities.renameProvider = false
        client.server_capabilities.selectionRangeProvider = false
        client.server_capabilities.signatureHelpProvider = false
        client.server_capabilities.typeDefinitionProvider = false
        client.server_capabilities.workspaceSymbolProvider = false
        client.server_capabilities.definitionProvider = false
        client.server_capabilities.documentHighlightProvider = false
        client.server_capabilities.documentSymbolProvider = false
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        local setup_inlay = vim.api.nvim_create_augroup("setup_inlay", { clear = true })
        vim.api.nvim_create_autocmd("InsertEnter", {
          group = setup_inlay,
          buffer = bufnr,
          callback = function() vim.lsp.inlay_hint.enable(bufnr, true) end,
        })
        vim.api.nvim_create_autocmd("InsertLeave", {
          group = setup_inlay,
          buffer = bufnr,
          callback = function() vim.lsp.inlay_hint.enable(bufnr, false) end,
        })
      end,
      init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
        ["language_server_worse_reflection.inlay_hints.enable"] = true,
      },
      handlers = {
        ['textDocument/publishDiagnostics'] = function() end
      }
    }

    -- Setup diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Setup border "rounded" to be used in floating window
    require("lspconfig.ui.windows").default_options.border = "rounded"
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })
    vim.diagnostic.config({
      float = {
        border = "rounded",
      }
    })
    require("lsp_signature").setup({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      }
    })
  end,
  keys = {
    { "K", vim.lsp.buf.hover, silent = true },
    { "<leader>gc", ":lua require('neogen').generate()<CR>", silent = true },
    { "<leader>gD", vim.lsp.buf.declaration, silent = true },
    { "<leader>gd", ":Telescope lsp_definitions path_display={'tail'}<CR>", silent = true },
    { "<leader>gr", ":Telescope lsp_references path_display={'tail'}<CR>", silent = true },
    { "<leader>gi", ":Telescope lsp_implementations path_display={'tail'}<CR>", silent = true },
    { "<leader>gt", ":Telescope lsp_type_definitions path_display={'tail'}<CR>", silent = true },
    { "<leader>gh", vim.lsp.buf.signature_help, silent = true },
    { "<leader>ge", vim.diagnostic.open_float, silent = true },
    { "<leader>rn", vim.lsp.buf.rename, silent = true },
    { "<leader>ca", vim.lsp.buf.code_action, silent = true },
    { "<leader>ca", vim.lsp.buf.code_action, silent = true },
    { "<leader>gwa", vim.lsp.buf.add_workspace_folder, silent = true },
    { "<leader>gwr", vim.lsp.buf.remove_workspace_folder, silent = true },
    { "<leader>gwl", function() P(vim.lsp.buf.list_workspace_folders()) end, silent = true },
    { "[g", vim.diagnostic.goto_prev, silent = true },
    { "]g", vim.diagnostic.goto_next, silent = true },
    { "[e", ":lua vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>", silent = true },
    { "]e", ":lua vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }<CR>", silent = true },
  }
}
