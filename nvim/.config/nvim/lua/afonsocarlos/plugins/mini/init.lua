local current_path = (...)

return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      -- Custom config
      require(current_path .. ".ai").setup()
      require(current_path .. ".hipatterns").setup()
      require(current_path .. ".surround").setup()

      -- Default config
      require("mini.indentscope").setup()
      require("mini.splitjoin").setup()
    end,
  },
}
