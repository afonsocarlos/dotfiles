local neogen = require("neogen")
local telescope_builtin = require "telescope.builtin"
local nnoremap = require("afonsocarlos.keymap").nnoremap
local vnoremap = require("afonsocarlos.keymap").vnoremap

-- LSP config (the mappings used in the default file don't quite work right)
nnoremap("K", vim.lsp.buf.hover, { silent = true })
nnoremap("<leader>gc", neogen.generate, { silent = true })
nnoremap("<leader>gf", vim.lsp.buf.format, { silent = true })
nnoremap("<leader>gD", vim.lsp.buf.declaration, { silent = true })
nnoremap("<leader>gd", telescope_builtin.lsp_definitions, { silent = true })
nnoremap("<leader>gr", telescope_builtin.lsp_references, { silent = true })
nnoremap("<leader>gi", telescope_builtin.lsp_implementations, { silent = true })
nnoremap("<leader>gh", vim.lsp.buf.signature_help, { silent = true })
nnoremap("<leader>gt", vim.lsp.buf.type_definition, { silent = true })
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
