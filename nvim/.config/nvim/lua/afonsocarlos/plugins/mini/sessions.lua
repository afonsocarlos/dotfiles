local M = {}

local setup_autosession = function()
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
end

M.setup = function()
  require("mini.sessions").setup({
    autoread = true,
  })

  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("AutoSession", { clear = true }),
    nested = true,
    once = true,
    callback = setup_autosession,
    desc = "Create Session automatically if it doesn't exist",
  })

end

return M
