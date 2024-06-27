local M = {}

M.setup = function()
  vim.keymap.set("n", "gS", "gs")
  require("mini.splitjoin").setup({
    mappings = {
      toggle = "gs",
    },
  })
end

return M
