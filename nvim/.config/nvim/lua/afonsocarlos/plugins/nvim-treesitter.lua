return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    -- { "windwp/nvim-ts-autotag", opts = { enable_close = false } },
    -- plugin for splitting/joining blocks of code
    {
      "Wansmer/treesj",
      opts = {
        use_default_keymaps = false,
        max_join_length = 300,
      },
    },
  },
  config = function()
    -- ensure these language parsers are installed
    local ensure_installed = {
      "bash",
      "blade",
      "c",
      "css",
      "dockerfile",
      "gitignore",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "php",
      "phpdoc",
      "query",
      "sql",
      "typescript",
      "vim",
      "vimdoc",
    }
    -- configure treesitter
    require("nvim-treesitter").install(ensure_installed)

    -- configuration
    require("nvim-treesitter-textobjects").setup({
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        selection_modes = {
          ["@parameter.outer"] = "v",
          ["@function.outer"] = "V",
          ["@class.outer"] = "V",
        },
      },
      move = {
        -- whether to set jumps in the jumplist
        set_jumps = true,
      },
    })
  end,
  keys = {
    { "af", ":lua require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')<CR>", mode = { "x", "o" }, silent = true },
    { "if", ":lua require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')<CR>", mode = { "x", "o" }, silent = true },
    { "ac", ":lua require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')<CR>", mode = { "x", "o" }, silent = true },
    { "ic", ":lua require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')<CR>", mode = { "x", "o" }, silent = true },
    { "as", ":lua require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals')<CR>", mode = { "x", "o" }, silent = true },

    { "<leader>a", ":lua require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')<CR>", mode = { "n", "x", "o" }, silent = true },
    { "<leader>A", ":lua require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.inner')<CR>", mode = { "n", "x", "o" }, silent = true },

    { "]m", ":lua require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')<CR>", mode = { "n", "x", "o" }, silent = true },
    { "]]", ":lua require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')<CR>", mode = { "n", "x", "o" }, silent = true },
    { "]M", ":lua require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')<CR>", mode = { "n", "x", "o" }, silent = true },
    { "][", ":lua require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')<CR>", mode = { "n", "x", "o" }, silent = true },
    { "[m", ":lua require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')<CR>", mode = { "n", "x", "o" }, silent = true },
    { "[[", ":lua require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')<CR>", mode = { "n", "x", "o" }, silent = true },
    { "[M", ":lua require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')<CR>", mode = { "n", "x", "o" }, silent = true },
    { "[]", ":lua require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')<CR>", mode = { "n", "x", "o" }, silent = true },
  },
}
