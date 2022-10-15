local folding = require "folding"
local lsp_installer_servers = require "nvim-lsp-installer"
local lspconfig = require "lspconfig"
local navic = require "nvim-navic"

lsp_installer_servers.setup({
  ensure_installed = { "intelephense", "pyright", "sumneko_lua" },
})
local installed_servers = lsp_installer_servers.get_installed_servers()

-- Loop through the installed servers and set them up
for _, server in ipairs(installed_servers) do
  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
  lspconfig[server.name].setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end

      folding.on_attach()

      -- Add some fancy integration
      local setup_lsp = vim.api.nvim_create_augroup("setup_lsp", { clear = true })
      vim.api.nvim_create_autocmd("CursorHold", {
        group = setup_lsp,
        pattern = "<buffer>",
        callback = function()
          vim.lsp.buf.document_highlight()
          vim.diagnostic.open_float()
        end
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        group = setup_lsp,
        pattern = "<buffer>",
        callback = function()
          vim.lsp.buf.clear_references()
        end
      })

    end
  })
end

require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "none"
  }
})


-- require "lspsaga".init_lsp_saga {
--   code_action_prompt = {
--     enable = true,
--     sign = true,
--     sign_priority = 20,
--     virtual_text = true,
--   }
-- }
