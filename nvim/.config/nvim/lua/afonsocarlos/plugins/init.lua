return {
  -- Tpope plugins
  "tpope/vim-abolish",   -- intelligent substitution
  "tpope/vim-dotenv",    -- basic support for .env and Procfile
  "tpope/vim-fugitive",  -- git integration for Vim
  "tpope/vim-repeat",    -- repeat last modification regarding to Plugin editions
  "tpope/vim-sleuth",    -- Heuristically set buffer options

  -- ********** Editing help tools **********

  -- Delete buffers without messing up layout
  "moll/vim-bbye",

  -- The undo history visualizer for VIM
  "mbbill/undotree",
  {
    "kevinhwang91/nvim-fundo",
    dependencies = { "kevinhwang91/promise-async" },
    build = function() require("fundo").install() end,
    lazy = false,
    config = true
  },

  -- Better quickfix window in Neovim
  { "kevinhwang91/nvim-bqf", ft = "qf" },

  -- modern matchit.
  "andymass/vim-matchup",

  -- Simple plugin that shows the current code context
  "SmiteshP/nvim-navic",

  -- A tree like view for symbols in Neovim
  { "simrat39/symbols-outline.nvim", config = true },

  -- Easily align chunks of code
  "junegunn/vim-easy-align",

  {
    "junegunn/fzf",
    build = "./install --all",
  },

  -- full signature help, docs and completion for the nvim lua API.
  {
    "folke/neodev.nvim",
    opts = {
      library = { plugins = { "neotest" }, types = true },
    },
  },

  -- Flutter tools
  {
    "akinsho/flutter-tools.nvim",
    ft = { "flutter", "dart" },
  },

  -- PHP tools
  "afonsocarlos/composer.nvim",

  -- AI stuff
  "Exafunction/codeium.vim",






  "ThePrimeagen/refactoring.nvim",
}
