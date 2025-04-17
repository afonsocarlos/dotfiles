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

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("auto_resize_windows", { clear = true }),
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- close some filetypes with <gq>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("quickclose", { clear = true }),
  pattern = {
    "fugitive",
    "git",
    "help",
    "lspinfo",
    "man",
    "neotest-summary",
    "notify",
    "qf",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "gq", "winnr('$') == 1 ? ':bdel<cr>' : ':close<cr>'", { buffer = event.buf, expr = true, silent = true })
  end,
})

-- composer.lock extension setup
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("composer_filetypedetect", { clear = true }),
  pattern = {
    "composer.lock",
  },
  command = [[ setfiletype json ]]
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
