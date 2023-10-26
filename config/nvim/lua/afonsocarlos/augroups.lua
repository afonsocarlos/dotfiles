-- Run PackerCompile on saving plugins.lua
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("packer_user_config", { clear = true }),
  pattern = "plugins.lua",
  command = [[ source <afile> | PackerCompile ]]
})

-- Strip trailing whitespaces
local treat_trailing_whitespace = vim.api.nvim_create_augroup("treat_trailing_whitespace", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = treat_trailing_whitespace,
  pattern = "*",
  command = [[highlight ExtraWhitespace ctermbg=red guibg=#382b2c]]
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = treat_trailing_whitespace,
  pattern = "*",
  command = [[match ExtraWhitespace /\s\+$/]]
})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = treat_trailing_whitespace,
  pattern = "*",
  callback = function()
    local search = vim.fn.getreg("/")
    local current_position = vim.api.nvim_win_get_cursor(0)

    vim.cmd [[%s/\s\+$//e]]

    vim.fn.setreg("/", search)
    vim.api.nvim_win_set_cursor(0, current_position)
  end
})

-- Make targets.vim use default braces
vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("targets_default", { clear = true }),
  pattern = "targets#mappings#user",
  command = [[
    call targets#mappings#extend({ 'b': {'pair': [{'o':'(', 'c':')'}]} })
  ]]
})

-- Defold extension setup
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("defold_filetypedetect", { clear = true }),
  pattern = {
    "*.script",
    "*.gui_script",
    "*.render_script",
    "*.editor_script",
  },
  command = [[ setfiletype lua ]]
})
