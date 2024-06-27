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

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("quickclose", { clear = true }),
  pattern = {
    "git",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "gq", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
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

vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("AutoSession", { clear = true }),
  nested = true,
  once = true,
  callback = function ()
    local has_mini_sessions, MiniSessions = pcall(require, "mini.sessions")

    if not has_mini_sessions then
      return
    end

    local lspconfig = require("lspconfig")

    local cwd = vim.fn.getcwd()
    local dir_root = lspconfig.util.find_git_ancestor(cwd)

    if not dir_root then
      MiniSessions.setup({ autoread = false })
      return
    end

    local HOME = os.getenv("HOME"):gsub("[.-]", "%%%1")
    local autosession_directories = {
      HOME .. "/.dotfiles",
      HOME .. "/build",
      HOME .. "/dev",
      HOME .. "/work",
    }

    for _, directory in ipairs(autosession_directories) do
      if cwd:find(directory) then

        local session_name = dir_root:gsub("/", "_")

        local session = MiniSessions.detected[session_name]
        if not session then
          vim.cmd("cd " .. dir_root)
          MiniSessions.write(session_name)
        else
          -- Hack Minisessions.detected table setting the modify_time for the session for the current directory as the
          -- greatest so "MiniSessions.get_latest()" retrieves the session for the current directory
          session.modify_time = vim.fn.getftime(session.path)
          MiniSessions.detected[session_name] = session
        end
      end
    end
  end,
  desc = "Create Session automatically if it doesn't exist"
})
