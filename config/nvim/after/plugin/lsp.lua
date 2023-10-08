-- local folding = require "folding"
local mason_lspconfig = require "mason-lspconfig"
local lspconfig = require "lspconfig"
local navic = require "nvim-navic"

require("mason").setup()

local servers = {
  intelephense = {},
  pyright = {},
  lua_ls = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
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

      -- folding.on_attach()

      -- Add some fancy integration
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("setup_lsp", { clear = true })
        vim.api.nvim_create_autocmd("CursorHold", {
          group = "setup_lsp",
          pattern = "<buffer>",
          callback = vim.lsp.buf.document_highlight
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          group = "setup_lsp",
          pattern = "<buffer>",
          callback = vim.lsp.buf.clear_references
        })
      end
    end
  })
end

require("lsp_signature").setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "none"
  }
})


-- require("lspsaga").init_lsp_saga {
--   code_action_prompt = {
--     enable = true,
--     sign = true,
--     sign_priority = 20,
--     virtual_text = true,
--   }
-- }
