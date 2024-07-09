return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      -- Custom config
      require("afonsocarlos.plugins.mini.ai").setup()
      require("afonsocarlos.plugins.mini.bracketed").setup()
      require("afonsocarlos.plugins.mini.hipatterns").setup()
      require("afonsocarlos.plugins.mini.icons").setup()
      require("afonsocarlos.plugins.mini.sessions").setup()
      require("afonsocarlos.plugins.mini.splitjoin").setup()
      require("afonsocarlos.plugins.mini.surround").setup()

      -- Default config
      require("mini.indentscope").setup()
    end,
  },
}
