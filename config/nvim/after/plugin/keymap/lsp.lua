local neogen = require("neogen")
local telescope_builtin = require "telescope.builtin"
local nnoremap = require("afonsocarlos.keymap").nnoremap
local vnoremap = require("afonsocarlos.keymap").vnoremap

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
nnoremap("K", vim.lsp.buf.hover, { silent = true })
nnoremap("<leader>gc", neogen.generate, { silent = true })
nnoremap("<leader>gf", vim.lsp.buf.format, { silent = true })
nnoremap("<leader>gD", vim.lsp.buf.declaration, { silent = true })
nnoremap("<leader>gd", function() telescope_builtin.lsp_definitions(config) end, { silent = true })
nnoremap("<leader>gr", function() telescope_builtin.lsp_references(config) end, { silent = true })
nnoremap("<leader>gi", function() telescope_builtin.lsp_implementations(config) end, { silent = true })
nnoremap("<leader>gt", function() telescope_builtin.lsp_type_definitions(config) end, { silent = true })
nnoremap("<leader>gh", vim.lsp.buf.signature_help, { silent = true })
nnoremap("<leader>ge", vim.diagnostic.open_float, { silent = true })
nnoremap("[g", vim.diagnostic.goto_prev, { silent = true })
nnoremap("]g", vim.diagnostic.goto_next, { silent = true })
nnoremap("[e", ":lua vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>", { silent = true })
nnoremap("]e", ":lua vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }<CR>", { silent = true })

-- ************* Nvim lspsaga *************
-- nnoremap <silent> <leader>gp require'lspsaga.provider'.preview_definition()
nnoremap("<leader>rn", vim.lsp.buf.rename, { silent = true })
nnoremap("<leader>ca", vim.lsp.buf.code_action, { silent = true })
vnoremap("<leader>ca", vim.lsp.buf.code_action, { silent = true })

-- nnoremap <silent><nowait><expr> <C-j> v:lua.require'lspsaga.hover'.has_saga_hover() ? "<cmd>:lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>" : "\<C-W>j"
-- nnoremap <silent><nowait><expr> <C-k> v:lua.require'lspsaga.hover'.has_saga_hover() ? "<cmd>:lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>" : "\<C-W>k"
-- inoremap <silent><nowait><expr> <C-j> v:lua.require'lspsaga.hover'.has_saga_hover() ? "\<c-r>=v:lua.require'lspsaga.action'.smart_scroll_with_saga(1)\<cr>" : "\<C-j>"
-- inoremap <silent><nowait><expr> <C-k> v:lua.require'lspsaga.hover'.has_saga_hover() ? "\<c-r>=v:lua.require'lspsaga.action'.smart_scroll_with_saga(-1)\<cr>" : "\<C-k>"
-- vnoremap <silent><nowait><expr> <C-j> v:lua.require'lspsaga.hover'.has_saga_hover() ? "<cmd>:lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>" : "\<C-W>j"
-- vnoremap <silent><nowait><expr> <C-k> v:lua.require'lspsaga.hover'.has_saga_hover() ? "<cmd>:lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>" : "\<C-W>k"
