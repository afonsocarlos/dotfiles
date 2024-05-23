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
