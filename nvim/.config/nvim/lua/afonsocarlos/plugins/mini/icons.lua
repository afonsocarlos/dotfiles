local M = {}

M.setup = function()
  local MiniIcons = require("mini.icons")

  MiniIcons.setup({
    extension = {
      ["blade.php"] = { glyph = "󰫐", hl = "MiniIconsRed" },
    },
  })
  MiniIcons.mock_nvim_web_devicons()
end

return M
