local toggle_dbui = function()
  local windows = vim.api.nvim_tabpage_list_wins(0)

  for _, win in ipairs(windows) do
    local buf = vim.api.nvim_win_get_buf(win)
    local bufname = vim.api.nvim_buf_get_name(buf)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf })
    if bufname:find("/queries/") or filetype == "dbout" then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
  vim.cmd("DBUIToggle")
end

return {
  -- UI for topoe's vim-dadbod
  "kristijanhusak/vim-dadbod-ui",
  lazy = true,
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_tmp_query_location = "~/queries"
  end,
  keys = {
    -- ************* DBUI *************
    { "<leader>l", toggle_dbui, mode = "n", silent = true },
  },
}
