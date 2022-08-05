local lsp_installer_servers = require('nvim-lsp-installer')
local lspconfig = require('lspconfig')

lsp_installer_servers.setup({
    ensure_installed = { 'intelephense', 'pyright', 'sumneko_lua' },
})
local installed_servers = lsp_installer_servers.get_installed_servers()

-- Loop through the installed servers and set them up
for _, server in ipairs(installed_servers) do
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    lspconfig[server.name].setup({
        capabilities = capabilities,
    })
end

require 'lsp_signature'.setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = 'none'
    }
})


-- vscode-like pictograms for neovim lsp completion items
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    -- with_text = true,
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})

-- require 'lspsaga'.init_lsp_saga {
--   code_action_prompt = {
--     enable = true,
--     sign = true,
--     sign_priority = 20,
--     virtual_text = true,
--   }
-- }
