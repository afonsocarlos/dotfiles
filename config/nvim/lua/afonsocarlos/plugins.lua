_ = vim.cmd [[packadd packer.nvim]]
_ = vim.cmd [[packadd vimball]]
_ = vim.cmd [[packadd cfilter]]

return require("packer").startup {
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Tpope plugins
    use "tpope/vim-abolish"
    use "tpope/vim-repeat"


    -- TJ plugins
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-ui-select.nvim"


    -- Colorscheme section
    use "navarasu/onedark.nvim" -- OneDark colorscheme for NeoVim

    -- Neovim frame setup
    use {
      -- Status line enhancement
      "nvim-lualine/lualine.nvim",
      "yamatsum/nvim-web-nonicons",
      {
        -- A file explorer tree
        "kyazdani42/nvim-tree.lua",

        requires = {
          "kyazdani42/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly" -- optional, updated every week. (see issue #1193)
      }
    }

    -- ********** Editing help tools **********
    use "junegunn/vim-easy-align"
    -- Delete buffers without messing up layout
    use "moll/vim-bbye"
    -- Git signs for vim
    use "lewis6991/gitsigns.nvim"
    -- Provides additional text objects
    use "wellle/targets.vim"
    -- The undo history visualizer for VIM
    use "mbbill/undotree"
    -- Smart and powerful comments plugin for Neovim
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end
    }
    -- Add/change/delete surrounding delimiter pairs with ease
    use {
      "kylechui/nvim-surround",
      tag = "*",
      config = function()
        require("nvim-surround").setup()
      end
    }
    use "jiangmiao/auto-pairs"
    -- highlight hex, rgb and colornames
    use "norcalli/nvim-colorizer.lua"


    -- Nvim Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Simple plugin that shows the current code context
    use "SmiteshP/nvim-navic"

    -- LSP Plugins:
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "petertriho/cmp-git"
    use "ray-x/lsp_signature.nvim"
    use "onsails/lspkind-nvim"

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "honza/vim-snippets"

    -- A better annotation generator
    use "danymat/neogen"

    -- Provides LSP server
    use "pierreglaser/folding-nvim"

    -- Out of the box LSP features even without language server
    use "jose-elias-alvarez/null-ls.nvim"

    -- Flutter tools
    use {
      "akinsho/flutter-tools.nvim",
      ft = { "flutter", "dart" },
    }
  end
}
