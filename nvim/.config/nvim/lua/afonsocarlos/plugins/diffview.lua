return {
  "sindrets/diffview.nvim",
  opts = {
    hooks = {
      diff_buf_read = function()
        vim.opt_local.wrap = false
      end,
    },
    keymaps = {
      view = {
        ["gq"] = ":DiffviewClose<CR>",
        ["gf"] = false,
      },
      file_panel = {
        ["gq"] = ":DiffviewClose<CR>",
      },
      file_history_panel = {
        ["gq"] = ":DiffviewClose<CR>",
      },
    },
  },
}
