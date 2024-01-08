local close_diff = function()
  local bufnr = vim.fn.bufnr("^fugitive://*/.git//0/*")
  if vim.api.nvim_buf_is_loaded(bufnr) and vim.opt.diff:get() then
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end
end

local toggle_diff_option = function(option)
  local status
  if vim.list_contains(vim.opt.diffopt:get(), option) then
    status = "off"
    vim.opt.diffopt:remove(option)
  else
    status = "on"
    vim.opt.diffopt:append(option)
  end
  vim.notify(option .. " " .. status)
end

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "samoshkin/vim-mergetool", -- Efficient way of using Vim as a Git mergetool
  },
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      current_line_blame_formatter = "  <author> • <author_time:%R> • <summary>",

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        vim.g.mergetool_layout = 'mr'
        vim.g.mergetool_prefer_revision = 'local'

        -- Navigation
        vim.keymap.set("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true })

        vim.keymap.set("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true })

        -- Diff View Shortcuts
        vim.keymap.set("n", "gq", function()
          if not vim.opt.diff:get() then return "gq" end
          vim.schedule(function() close_diff() end)
          return "<Ignore>"
        end, { expr = true })

        vim.keymap.set("n", "gw", function()
          if not vim.opt.diff:get() then return "gw" end
          vim.schedule(function() toggle_diff_option("iwhite") end)
          return "<Ignore>"
        end, { expr = true })

        vim.keymap.set("n", "gW", function()
          if not vim.opt.diff:get() then return "gW" end
          vim.schedule(function() toggle_diff_option("iwhiteall") end)
          return "<Ignore>"
        end, { expr = true })
      end,
    })
  end,
  keys = {
    -- Gitsigns Shortcuts
    { "<leader>hs", ":Gitsigns stage_hunk<CR>", mode = { "n", "v" }, silent = true },
    { "<leader>hu", ":Gitsigns reset_hunk<CR>", mode = { "n", "v" }, silent = true },
    { "<leader>hS", ":Gitsigns stage_buffer<CR>", silent = true },
    { "<leader>hU", ":Gitsigns reset_buffer<CR>", silent = true },
    { "<leader>hr", ":Gitsigns undo_stage_hunk<CR>", silent = true },
    { "<leader>hp", ":Gitsigns preview_hunk<CR>", silent = true },
    { "<leader>hP", ":Gitsigns preview_hunk_inline<CR>", silent = true },
    { "<leader>hb", ":Gitsigns blame_line<CR>", silent = true },
    { "<leader>hB", ":Gitsigns blame_line full=true<CR>", silent = true },
    { "<leader>ht", ":Gitsigns toggle_current_line_blame<CR>", silent = true },

    -- Fugitive Shortcuts
    { "<leader>hd", ":Gdiffsplit<CR>", silent = true },
    { "<leader>gs", ":G<CR>", silent = true },
    { "<leader>gl", ":G! pull<CR>", silent = true },
    { "<leader>gp", ":G! push<CR>", silent = true },

    { "<leader>hc", "<plug>(MergetoolToggle)", silent = true },
    { "<leader>hct", ":call mergetool#toggle_layout('mr,b')<CR>", silent = true },
  },
}
