return {
  -- Colorscheme section
  "navarasu/onedark.nvim", -- OneDark colorscheme for NeoVim

  lazy = false,
  priority = 1000,
  config = function()
    local onedark = require('onedark')
    onedark.setup()
    onedark.load()
  end,
}
