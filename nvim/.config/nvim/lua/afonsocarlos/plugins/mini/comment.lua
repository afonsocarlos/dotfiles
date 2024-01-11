return {
  "echasnovski/mini.comment",
  version = "*",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local context_commentstring = require("ts_context_commentstring")
    context_commentstring.setup({
      enable_autocmd = false,
    })

    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return context_commentstring.calculate_commentstring() or vim.bo.commentstring
        end,
      },

      hooks = {
        post = function()
          vim.cmd("normal! ^")
        end,
      },
    })
  end,
}
