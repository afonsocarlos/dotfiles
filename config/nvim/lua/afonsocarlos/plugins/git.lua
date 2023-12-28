local close_diff = function()
  local bufnr = vim.fn.bufnr("^fugitive://*/.git//0/*")
  if vim.api.nvim_buf_is_loaded(bufnr) and vim.opt.diff:get() then
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end
end

local toggle_diff_option = function(option)
  return function()
    if not vim.opt.diff:get() then
      return
    end

    if vim.list_contains(vim.opt.diffopt:get(), option) then
      vim.opt.diffopt:remove(option)
    else
      vim.opt.diffopt:append(option)
    end
  end
end

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      current_line_blame_formatter = "  <author> • <author_time:%R> • <summary>",

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

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

    -- Diff View Shortcuts
    { "gq", close_diff, silent = true },
    { "gs", toggle_diff_option("iwhite"), silent = true },
    { "gS", toggle_diff_option("iwhiteall"), silent = true },
  },
}