local neogen = require("neogen")
local telescope_themes = require "telescope.themes"
local nnoremap = require("afonsocarlos.keymap").nnoremap
local vnoremap = require("afonsocarlos.keymap").vnoremap
local telescope_nmap = require("afonsocarlos.keymap").telescope_nmap

local cursor_theme = telescope_themes.get_cursor {
  path_display = { "tail" },
  layout_config = {
    width = 0.8,
    height = 12,
  }
}

-- LSP config (the mappings used in the default file don't quite work right)
nnoremap("K", vim.lsp.buf.hover, { silent = true })
nnoremap("<Leader>gc", neogen.generate, { silent = true })
nnoremap("<leader>gf", vim.lsp.buf.format, { silent = true })
nnoremap("<leader>gD", vim.lsp.buf.declaration, { silent = true })
telescope_nmap("<leader>gd", "lsp_definitions", cursor_theme)
telescope_nmap("<leader>gr", "lsp_references", vim.tbl_extend("force", cursor_theme, { include_current_line = true }))
telescope_nmap("<leader>gi", "lsp_implementations", cursor_theme)
nnoremap("<leader>gh", vim.lsp.buf.signature_help, { silent = true })
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
