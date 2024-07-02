local M = {}

M.setup = function()
  require("mini.bracketed").setup({
    comment = { suffix = "/" },
    -- Disable all navigations below
    diagnostic = { suffix = "" },
    file = { suffix = "" },
    indent = { suffix = "" },
    jump = { suffix = "" },
    oldfile = { suffix = "" },
    treesitter = { suffix = "" },
    undo = { suffix = "" },
    window = { suffix = "" },
  })
end

return M
