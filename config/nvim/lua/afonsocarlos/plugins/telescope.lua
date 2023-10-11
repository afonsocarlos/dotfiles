-- TJ plugins
return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")
    local icons = require("nvim-nonicons")

    telescope.setup({
      defaults = {
        prompt_prefix = "  " .. icons.get("telescope") .. "  ",
        selection_caret = " ❯ ",
        entry_prefix = "   ",
        file_sorter = require("telescope.sorters").get_fzy_sorter,
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = false,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        fzf_writer = {
          minimum_grep_characters = 2,
          minimum_files_characters = 2,
          use_highlighter = true,
        },
        -- fzy_native = {
        --   override_generic_sorter = false,
        --   override_file_sorter = true,
        -- }
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {         -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-j>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
        },
        ["ui-select"] = {
          require("telescope.themes").get_cursor()
        }
      }
    })

    -- telescope.load_extension("fzf")
    -- telescope.load_extension("fzy_native")
    telescope.load_extension("ui-select")
  end,
  keys = {
    { "<leader>fa", ":Telescope grep_string<CR>" },
    { "<leader>fb", ":Telescope buffers<CR>" },
    { "<leader>fc", ":Telescope git_branches<CR>" },
    { "<leader>fd", ":Telescope diagnostics<CR>" },
    { "<leader>ff", ":Telescope find_files<CR>" },
    { "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" },
    { "<leader>fh", ":Telescope help_tags<CR>" },
    { "<leader>fl", ":Telescope current_buffer_fuzzy_find<CR>" },
    { "<leader>fr", ":Telescope oldfiles<CR>" },
  }
}
