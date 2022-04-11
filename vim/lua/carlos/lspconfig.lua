-- Handles language servers installation automatically
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{
    on_attach = function(client, bufnr)
      require 'lsp_signature'.on_attach()
    end
  }
end

-- vscode-like pictograms for neovim lsp completion items
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

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

