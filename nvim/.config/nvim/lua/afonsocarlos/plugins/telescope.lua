-- TJ plugins
return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local lga_actions = require("telescope-live-grep-args.actions")
    local icons = require("nvim-nonicons")

    telescope.setup({
      defaults = {
        prompt_prefix = "  " .. icons.get("telescope") .. "  ",
        selection_caret = " ❯ ",
        entry_prefix = "   ",
        file_ignore_patterns = { "^.git/", "node_modules" },
        mappings = {
          i = {
            ["<C-b>"] = actions.preview_scrolling_left,
            ["<C-f>"] = actions.preview_scrolling_right,
            ["<M-b>"] = actions.results_scrolling_left,
            ["<M-f>"] = actions.results_scrolling_right,
          },
          n = {
            ["<Left>"] = actions.preview_scrolling_left,
            ["<Right>"] = actions.preview_scrolling_right,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
      },

      pickers = {
        buffers = {
          file_ignore_patterns = {},
          show_all_buffers = true,
          mappings = {
            i = {
              ["<M-d>"] = "delete_buffer",
            },
            n = {
              ["d"] = "delete_buffer",
            },
          },
        },
        find_files = {
          hidden = true,
          mappings = {
            i = {
              ["<C-h>"] = function(prompt_bufnr)
                local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                local opts = {
                  hidden = true,
                  no_ignore = true,
                  default_text = current_picker:_get_prompt(),
                }

                local cmd = { "fd", "--type", "f", "--hidden", "--no-ignore" }
                current_picker:refresh(finders.new_oneshot_job(cmd, opts), {})
              end,
            },
          },
        },
        git_branches = {
          mappings = {
            i = {
              ["<cr>"] = actions.git_switch_branch,
            },
          }
        }
      },

      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-j>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-e>"] = actions.to_fuzzy_refine,
            },
          },
        },
        ["ui-select"] = {
          require("telescope.themes").get_cursor(),
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
  keys = {
    { "<leader>f/", ":Telescope current_buffer_fuzzy_find<CR>", silent = true },
    { "<leader>fa", ":Telescope grep_string<CR>", silent = true },
    { "<leader>fa", [["vy:lua require('telescope.builtin').grep_string({search = vim.fn.getreg('v')})<CR>]], mode = "v", silent = true },
    { "<leader>fb", ":Telescope buffers<CR>", silent = true },
    { "<leader>fc", ":Telescope git_branches<CR>", silent = true },
    { "<leader>fd", ":Telescope diagnostics<CR>", silent = true },
    { "<leader>ff", ":Telescope find_files<CR>", silent = true },
    { "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", silent = true },
    { "<leader>fh", ":Telescope help_tags<CR>", silent = true },
    { "<leader>fl", ":Telescope git_bcommits<CR>", silent = true },
    { "<leader>fl", ":<C-U>Telescope git_bcommits_range<CR>", mode = "v", silent = true },
    { "<leader>fo", ":Telescope oldfiles<CR>", silent = true },
    { "<leader>fr", ":Telescope resume<CR>", silent = true },
    { "<leader>ft", ":Telescope<CR>", silent = true },
  },
}
