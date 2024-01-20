return {
  -- Tpope plugins
  "tpope/vim-abolish", -- intelligent substitution
  "tpope/vim-dotenv", -- basic support for .env and Procfile
  "tpope/vim-fugitive", -- git integration for Vim
  "tpope/vim-obsession", -- continuously updated session files
  "tpope/vim-repeat", -- repeat last modification regarding to Plugin editions
  "tpope/vim-sleuth", -- Heuristically set buffer options

  -- ********** Editing help tools **********
  -- Mini plugins
  { import = "afonsocarlos.plugins.mini" },

  -- Easily align chunks of code
  "junegunn/vim-easy-align",
  -- Delete buffers without messing up layout
  "moll/vim-bbye",

  -- The undo history visualizer for VIM
  "mbbill/undotree",

  -- Better quickfix window in Neovim
  { "kevinhwang91/nvim-bqf", ft = "qf" },

  -- modern matchit.
  "andymass/vim-matchup",

  -- Provides LSP server
  "pierreglaser/folding-nvim",

  -- Simple plugin that shows the current code context
  "SmiteshP/nvim-navic",

  -- A tree like view for symbols in Neovim
  { "simrat39/symbols-outline.nvim", config = true },

  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
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
  "adalessa/composer.nvim",

  -- AI stuff
  "Exafunction/codeium.vim",






  "ThePrimeagen/refactoring.nvim",
}
