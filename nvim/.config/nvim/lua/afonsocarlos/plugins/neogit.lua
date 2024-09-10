local goto_section = function(section)
  return function()
    local line = vim.fn.search("^" .. section)
    if line > 0 then
      vim.cmd("norm zo")
    end
  end
end

return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  opts = {
    graph_style = "unicode",
    kind = "split_below_all",
    commit_editor = {
      kind = "split_below_all",
      show_staged_diff = true,
      staged_diff_split_kind = "vsplit",
    },
    popup = {
      kind = "split_below_all",
    },
    mappings = {
      commit_editor = {
        ["gq"] = "Close",
      },
      rebase_editor = {
        ["gq"] = "Close",
      },
      status = {
        ["gq"] = "Close",
        ["gc"] = goto_section("recent commits"),
        ["gs"] = goto_section("staged"),
        ["gU"] = goto_section("unstaged"),
        ["gu"] = goto_section("untracked"),
        ["gz"] = goto_section("stash"),
      },
    },
  },
  keys = {
    { "<leader>gc", ":Neogit commit<CR>", silent = true },
  },
}
