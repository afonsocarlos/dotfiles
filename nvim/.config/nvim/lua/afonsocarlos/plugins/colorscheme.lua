return {
  "navarasu/onedark.nvim", -- OneDark colorscheme for NeoVim

  lazy = false,
  priority = 1000,
  config = function()
    local onedark = require("onedark")
    local palette = require("onedark.palette").dark
    onedark.setup({
      highlights = {
        MiniHipatternsFixme = { fg = palette.red, bg = "NONE", fmt = "NONE" },
        MiniHipatternsHack =  { fg = palette.yellow, bg = "NONE", fmt = "NONE" },
        MiniHipatternsNote =  { fg = palette.purple, bg = "NONE", fmt = "NONE" },
        MiniHipatternsTodo =  { fg = palette.cyan, bg = "NONE", fmt = "NONE" },
      }
    })
    onedark.load()
  end,
}
