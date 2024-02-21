local textobjects = {
  select = {
    enable = true,

    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,

    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = { query = "@function.full", desc = "Select outer part of a method/function definition" },
      ["if"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
      ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
      ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
    },
    -- You can choose the select mode (default is charwise 'v')
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V',  -- linewise
      ['@function.full'] = 'V',  -- linewise
      ['@class.outer'] = '<c-v>', -- blockwise
    },
    -- If you set this to `true` (default is `false`) then any textobject is
    -- extended to include preceding xor succeeding whitespace. Succeeding
    -- whitespace has priority in order to act similarly to eg the built-in
    -- `ap`.
    include_surrounding_whitespace = false,
  },

  swap = {
    enable = true,
    swap_next = {
      ["<leader>a"] = "@parameter.inner",
    },
    swap_previous = {
      ["<leader>A"] = "@parameter.inner",
    },
  },

  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]]"] = "@class.outer",
    },
    goto_next_end = {
      ["]M"] = "@function.outer",
      ["]["] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
    -- { "windwp/nvim-ts-autotag", opts = { enable_close = false } },
    -- plugin for splitting/joining blocks of code
    {
      "Wansmer/treesj",
      opts = {
        use_default_keymaps = false,
        max_join_length = 300,
      }
    },

  },
  config = function()
    -- configure treesitter
    require("nvim-treesitter.configs").setup({
      textobjects = textobjects,
      -- ensure these language parsers are installed
      ensure_installed = {
        "bash",
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
      },
      highlight = { enable = true },
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      -- autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",

          -- old config
          -- init_selection = "gnn", -- set to `false` to disable one of the mappings
          -- node_incremental = "grn",
          -- scope_incremental = "grc",
          -- node_decremental = "grm",
        },
      },
    })

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {"src/parser.c"},
        branch = "main",
      },
      filetype = "blade"
    }

    vim.filetype.add({
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    })
  end
}
