return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = function()
    local ufo = require("ufo")

    -- Folding options
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- TODO: move this to `keys = {}`
    vim.keymap.set("n", "zR", function()
      vim.b.fold_level = 5
      ufo.openAllFolds()
    end)
    vim.keymap.set("n", "zM", function()
      vim.b.fold_level = 0
      ufo.closeAllFolds()
    end)
    vim.keymap.set("n", "zr", function()
      vim.b.fold_level = vim.b.fold_level or 2
      vim.b.fold_level = math.min(vim.wo.foldnestmax, vim.b.fold_level + 1)
      ufo.closeFoldsWith(vim.b.fold_level)
    end)
    vim.keymap.set("n", "zm", function()
      vim.b.fold_level = vim.b.fold_level or 2
      vim.b.fold_level = math.max(0, vim.b.fold_level - 1)
      ufo.closeFoldsWith(vim.b.fold_level)
    end)
  end,
}
