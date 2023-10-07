local default_opts = require("afonsocarlos.keymap").default_opts

require("gitsigns").setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
    delay = 500,
    ignore_whitespace = false,
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

    -- Actions
    vim.keymap.set({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", default_opts)
    vim.keymap.set({ "n", "v" }, "<leader>hu", ":Gitsigns reset_hunk<CR>", default_opts)
    vim.keymap.set("n", "<leader>hS", gs.stage_buffer)
    vim.keymap.set("n", "<leader>hr", gs.undo_stage_hunk)
    vim.keymap.set("n", "<leader>hU", gs.reset_buffer)
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk)
    vim.keymap.set("n", '<leader>hd', gs.diffthis)
    vim.keymap.set("n", "<leader>hb", function() gs.blame_line { full = true } end)
    vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame)
  end
}
