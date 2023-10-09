local lga_actions = require("telescope-live-grep-args.actions")
local icons = require("nvim-nonicons")


require("telescope").setup {
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
      mappings = { -- extend mappings
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
}

-- require("telescope").load_extension("fzf")
-- require("telescope").load_extension("fzy_native")
require("telescope").load_extension("ui-select")
