return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      lua = { "luacheck" },
      php = { "phpstan" },
    }

    vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
