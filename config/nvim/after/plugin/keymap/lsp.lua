local neogen = require("neogen")
local telescope_builtin = require "telescope.builtin"
local default_opts = require("afonsocarlos.keymap").default_opts

local config = {
  path_display = function(opts, path)
    local os_sep = require("telescope.utils").get_separator()
    local found_first = false
    for i = #path, 1, -1 do
      if path:sub(i, i) == os_sep then
        if found_first then
          return path:sub(i + 1, -1)
        end
        found_first = true
      end
    end
    return path
  end,
}

-- LSP config (the mappings used in the default file don't quite work right)
vim.keymap.set("n", "K", vim.lsp.buf.hover, default_opts)
vim.keymap.set("n", "<leader>gc", neogen.generate, default_opts)
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, default_opts)
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, default_opts)
vim.keymap.set("n", "<leader>gd", function() telescope_builtin.lsp_definitions(config) end, default_opts)
vim.keymap.set("n", "<leader>gr", function() telescope_builtin.lsp_references(config) end, default_opts)
vim.keymap.set("n", "<leader>gi", function() telescope_builtin.lsp_implementations(config) end, default_opts)
vim.keymap.set("n", "<leader>gt", function() telescope_builtin.lsp_type_definitions(config) end, default_opts)
vim.keymap.set("n", "<leader>gh", vim.lsp.buf.signature_help, default_opts)
vim.keymap.set("n", "<leader>ge", vim.diagnostic.open_float, default_opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, default_opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, default_opts)
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, default_opts)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, default_opts)
vim.keymap.set("n", "]g", vim.diagnostic.goto_next, default_opts)
vim.keymap.set("n", "[e", ":lua vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>", default_opts)
vim.keymap.set("n", "]e", ":lua vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }<CR>", default_opts)
