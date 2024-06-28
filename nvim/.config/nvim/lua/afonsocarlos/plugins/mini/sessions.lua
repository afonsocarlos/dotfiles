local M = {}

local setup_autosession = function()
  local MiniSessions = require("mini.sessions")
  local lspconfig = require("lspconfig")

  local cwd = vim.fn.getcwd()
  local project_root = lspconfig.util.find_git_ancestor(cwd)

  if not project_root then
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
      local session_name = project_root:gsub("/", "_")

      local session = MiniSessions.detected[session_name]
      if not session then
        vim.cmd("cd " .. project_root)
        MiniSessions.write(session_name)
      else
        -- Hack Minisessions.detected table setting the modify_time for the session for the current directory as the
        -- greatest so "MiniSessions.get_latest()" retrieves the session for the current directory
        session.modify_time = vim.fn.getftime(session.path)
        MiniSessions.detected[session_name] = session
      end

      return
    end
  end

  -- If cwd is in none of the autosession_directories simply don't autoload session
  MiniSessions.setup({ autoread = false })
end

M.setup = function()
  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("AutoSession", { clear = true }),
    nested = true,
    once = true,
    callback = setup_autosession,
    desc = "Create Session automatically if it doesn't exist",
  })

  require("mini.sessions").setup({
    autoread = true,
  })
end

return M
