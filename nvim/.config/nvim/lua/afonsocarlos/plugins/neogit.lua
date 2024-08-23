return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = {
    graph_style = "unicode",
    kind = "split",
    commit_editor = {
      kind = "split",
      show_staged_diff = true,
      staged_diff_split_kind = "vsplit",
    },
    popup = {
     kind = "split",
    },
  },
}
