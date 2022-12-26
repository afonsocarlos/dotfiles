local nnoremap = require("afonsocarlos.keymap").nnoremap

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
    nnoremap("]c", function()
      if vim.wo.diff then return "]c" end
      vim.schedule(function() gs.next_hunk() end)
      return "<Ignore>"
    end, { expr=true })

    nnoremap("[c", function()
      if vim.wo.diff then return "[c" end
      vim.schedule(function() gs.prev_hunk() end)
      return "<Ignore>"
    end, { expr=true })

    -- Actions
    vim.keymap.set({ "n", "v" },"<leader>hs", ":Gitsigns stage_hunk<CR>", { noremap = true, silent = true })
    vim.keymap.set({ "n", "v" }, "<leader>hu", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
    nnoremap("<leader>hS", gs.stage_buffer)
    nnoremap("<leader>hr", gs.undo_stage_hunk)
    nnoremap("<leader>hU", gs.reset_buffer)
    nnoremap("<leader>hp", gs.preview_hunk)
    nnoremap('<leader>hd', gs.diffthis)
    nnoremap("<leader>hb", function() gs.blame_line { full=true } end)
    nnoremap("<leader>tb", gs.toggle_current_line_blame)
  end
}
