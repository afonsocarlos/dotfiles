return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        autohide = true,
        highlight = {
          backdrop = false,
          matches = false,
        },
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "?", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" },
    { "r", function() require("flash").remote() end, mode = "o", desc = "Remote Flash" },
    { "R", function() require("flash").treesitter_search() end, mode = { "o", "x" }, desc = "Treesitter Search" },
  },
}
