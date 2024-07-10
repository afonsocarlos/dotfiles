local M = {}

local is_something_shown = function()
  return vim.fn.argc() > 0 or vim.api.nvim_buf_line_count(0) > 1
end

local setup_autosession = function()
  local root_git = vim.fs.find({ ".git" }, { upward = true })[1]

  if not root_git then
    return
  end

  local project_root = vim.fs.dirname(root_git)
  local session_name = project_root:gsub("/", "%%")

  local HOME = os.getenv("HOME"):gsub("[.-]", "%%%1")
  local autosession_directories = {
    HOME .. "/.dotfiles",
    HOME .. "/build",
    HOME .. "/dev",
    HOME .. "/work",
  }

  for _, directory in ipairs(autosession_directories) do
    if project_root:find(directory) then
      local session = MiniSessions.detected[session_name]
      if session then
        -- does not auto load session if something else is shown
        if is_something_shown() then
          return
        end

        MiniSessions.read(session_name)
      else
        vim.fn.chdir(project_root)
        MiniSessions.write(session_name)
      end

      return
    end
  end
end

M.setup = function()
  require("mini.sessions").setup()

  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("AutoSession", { clear = true }),
    nested = true,
    once = true,
    callback = setup_autosession,
    desc = "Create and Load Session automatically",
  })

  vim.api.nvim_create_user_command("SSave", function(opts)
    local session_name = nil
    if opts.args ~= "" then
      session_name = opts.args
    end
    MiniSessions.write(session_name)
  end, {
    complete = function()
      local sessions = {}
      for session, _ in pairs(MiniSessions.detected) do
        table.insert(sessions, session)
      end
      return sessions
    end,
    nargs = "?",
  })

  vim.api.nvim_create_user_command("SSelect", function(opts)
    local action = nil
    if opts.args ~= "" then
      action = opts.args
    end
    MiniSessions.select(action, { force = opts.bang })
  end, {
    bang = true,
    complete = function()
      return { "read", "write", "delete" }
    end,
    nargs = "?",
  })
end

return M
