local lsp_installer_servers = require('nvim-lsp-installer.servers')

local servers = {
    intelephense = 1,
    pyright = 1,
    lua = 1,
}

-- Get list of installed servers
local installed_servers = lsp_installer_servers.get_installed_server_names()
vim.tbl_add_reverse_lookup(installed_servers)

-- Then merge it into the list of predefined servers
servers = vim.tbl_extend('keep', servers, installed_servers)
servers = vim.tbl_keys(servers)
servers = vim.tbl_filter(function (item)
    return not tonumber(item)
end, servers)

-- Loop through the servers listed above and set them up. If a server is
-- not already installed, install it.
for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function ()
            -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
            -- this function will be invoked. Make sure not to also use the "catch-all" lsp_installer.on_server_ready()
            -- function to set up your servers, because by doing so you'd be setting up the same server twice.
            local opts = {}
            server:setup(opts)
        end)
        if not server:is_installed() then
            -- Queue the server to be installed.
            server:install()
        end
    end
end

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

