return {
  -- Tpope plugins
  "tpope/vim-abolish",
  "tpope/vim-dotenv",
  "tpope/vim-fugitive",
  "tpope/vim-obsession",
  "tpope/vim-repeat",

  -- ********** Editing help tools **********
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

  -- highlight hex, rgb and colornames
  { "norcalli/nvim-colorizer.lua", config = true },

  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end
  },

  -- Flutter tools
  {
    "akinsho/flutter-tools.nvim",
    ft = { "flutter", "dart" },
  },

  -- AI stuff
  {
    "Exafunction/codeium.vim",
    config = function ()
      vim.g.codeium_manual = true
    end
  },






  "ThePrimeagen/refactoring.nvim",
}
