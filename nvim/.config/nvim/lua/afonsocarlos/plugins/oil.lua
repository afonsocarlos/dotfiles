return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    columns = {
      "icon",
      "permissions",
      "size",
    },
    keymaps = {
      ["<leader>-"] = "actions.close",
      ["<leader>e"] = "actions.refresh",
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["<M-h>"] = "actions.select_split",
      ["<M-v>"] = "actions.select_vsplit",
      ["g/"] = function ()
        local project_root = require("lspconfig").util.find_git_ancestor(vim.fn.getcwd())
        vim.cmd("cd " .. project_root)
        vim.notify("CWD: " .. project_root)
      end,
      ["gq"] = function()
        local oil = require("oil")
        oil.save(nil, function(err)
          if err then
            if err ~= "Canceled" then
              vim.notify(err, vim.log.levels.ERROR)
            end
          else
            oil.close()
          end
        end)
      end,
      ["<leader>ff"] = {
        function()
          require('fzf-lua').files({
            cwd = require("oil").get_current_dir(),
          })
        end,
        mode = "n",
        nowait = true,
        desc = "Find files in the current directory"
      },
    },
    lsp_file_methods = {
      autosave_changes = "unmodified",
    },
    prompt_save_on_select_new_entry = false,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        local always_hidden = {
          [".git"] = true,
        }
        return always_hidden[name]
      end,
    },
  },
  keys = {
    { "<leader>-", "<CMD>Oil<CR>", mode = "n", silent = true },
  },
}
