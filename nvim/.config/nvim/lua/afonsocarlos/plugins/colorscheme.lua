return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local catppuccin = require("catppuccin")
    catppuccin.setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      custom_highlights = function(colors)
        return {
          Search = { bg = colors.yellow, fg = colors.mantle },
          IncSearch = { bg = colors.peach, fg = colors.mantle },
          CurSearch = { bg = colors.peach, fg = colors.mantle },
          Substitute = { bg = colors.mauve, fg = colors.mantle },

          MiniHipatternsFixme = { fg = colors.red, bg = "NONE" },
          MiniHipatternsHack =  { fg = colors.yellow, bg = "NONE" },
          MiniHipatternsNote =  { fg = colors.mauve, bg = "NONE" },
          MiniHipatternsTodo =  { fg = colors.sapphire, bg = "NONE" },
        }
      end,

    })
  end,
}
