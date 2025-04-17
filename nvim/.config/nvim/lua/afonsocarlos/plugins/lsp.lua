local goto_definition = function()
  local clients = vim.lsp.get_clients({ bufnr = vim.fn.bufnr() })
  if not next(clients) then return "<C-]>" end
  vim.schedule(function()
    require("fzf-lua").lsp_definitions({
      ignore_current_line = true,
      formatter = "path.filename_first",
    })
  end)
  return "<Ignore>"
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local navic = require("nvim-navic")

    local servers = {
      intelephense = {},
      jsonls = {},
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
        },
      },
      pyright = {},
    }

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true,
    })
    local installed_servers = mason_lspconfig.get_installed_servers()

    -- Loop through the installed servers and set them up
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    for _, server_name in ipairs(installed_servers) do
      lspconfig[server_name].setup({
        settings = servers[server_name],
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end

          -- Add some fancy integration
          local setup_lsp_highlight = vim.api.nvim_create_augroup("setup_lsp_highlight", { clear = true })
          if client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd("CursorHold", {
              group = setup_lsp_highlight,
              buffer = bufnr,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              group = setup_lsp_highlight,
              buffer = bufnr,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
    end

    lspconfig.phpactor.setup({
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
          callback = function() vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end,
        })
        vim.api.nvim_create_autocmd("InsertLeave", {
          group = setup_inlay,
          buffer = bufnr,
          callback = function() vim.lsp.inlay_hint.enable(false, { bufnr = bufnr }) end,
        })
      end,
      init_options = {
        ["language_server_worse_reflection.inlay_hints.enable"] = true,
      },
    })

    vim.diagnostic.config({
      virtual_lines = {
       -- Only show virtual line diagnostics for the current cursor line
       current_line = true,
      },
    })
  end,
  keys = {
    { "grD", vim.lsp.buf.declaration, silent = true }, -- Probably delete this one
    { "<C-]>", goto_definition, expr = true },
    { "grr", ":FzfLua lsp_references ignore_current_line=true formatter=path.filename_first<CR>", silent = true },
    { "gri", ":FzfLua lsp_implementations ignore_current_line=true formatter=path.filename_first<CR>", silent = true },
    { "grt", ":FzfLua lsp_typedefs ignore_current_line=true formatter=path.filename_first<CR>", silent = true },
    { "grs", vim.lsp.buf.signature_help, silent = true },
    { "grd", vim.diagnostic.open_float, silent = true },
    { "grwa", vim.lsp.buf.add_workspace_folder, silent = true },
    { "grwr", vim.lsp.buf.remove_workspace_folder, silent = true },
    { "grwl", function() P(vim.lsp.buf.list_workspace_folders()) end, silent = true },
    { "[e", ":lua vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>", silent = true },
    { "]e", ":lua vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }<CR>", silent = true },
    { "[t", ":pop<CR>", silent = true },
    { "]t", ":tag<CR>", silent = true },
  },
}
