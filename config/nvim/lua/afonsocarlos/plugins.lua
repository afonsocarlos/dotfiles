local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  -- Tpope plugins
  "tpope/vim-abolish",
  "tpope/vim-dadbod",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",

  -- UI for topoe's vim-dadbod
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- TJ plugins
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope-live-grep-args.nvim",


  -- Colorscheme section
  "navarasu/onedark.nvim", -- OneDark colorscheme for NeoVim

  -- Neovim frame setup
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- Status line enhancement
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "yamatsum/nvim-web-nonicons",
  },

  -- ********** Editing help tools **********
  "junegunn/vim-easy-align",
  -- Delete buffers without messing up layout
  "moll/vim-bbye",
  -- Vim REPL slime
  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_no_mappings = 1
      vim.g.slime_default_config = {
        socket_name = "default",
        target_pane = "{last}"
      }
    end
  },
  -- Git signs for vim
  "lewis6991/gitsigns.nvim",
  -- Provides additional text objects
  "wellle/targets.vim",
  -- The undo history visualizer for VIM
  "mbbill/undotree",
  -- Smart and powerful comments plugin for Neovim
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },
  -- Add/change/delete surrounding delimiter pairs with ease
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup()
    end
  },
  "jiangmiao/auto-pairs",
  -- highlight hex, rgb and colornames
  "norcalli/nvim-colorizer.lua",

  -- plugin for splitting/joining blocks of code
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter" },
    config = function()
      require("treesj").setup({ use_default_keymaps = false })
    end,
  },

  -- Better quickfix window in Neovim
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end
  },

  -- Nvim Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Simple plugin that shows the current code context
  "SmiteshP/nvim-navic",

  -- A tree like view for symbols in Neovim
  "simrat39/symbols-outline.nvim",

  -- LSP Plugins:
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "petertriho/cmp-git",
  "ray-x/lsp_signature.nvim",
  "onsails/lspkind-nvim",

  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "honza/vim-snippets",

  -- A better annotation generator
  "danymat/neogen",

  -- Provides LSP server
  "pierreglaser/folding-nvim",

  -- Out of the box LSP features even without language server
  "jose-elias-alvarez/null-ls.nvim",

  -- Flutter tools
  {
    "akinsho/flutter-tools.nvim",
    ft = { "flutter", "dart" },
  },
}

local opts = {
  -- defaults = {
  -- lazy = true
  -- }
}

require("lazy").setup(plugins, opts)
