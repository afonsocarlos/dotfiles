local default_opts = require("afonsocarlos.keymap").default_opts

-- Out of the box LSP features even without language server
return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        php = { "pint" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
      },
    })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })
  end,
  keys = {
    { "<leader>gf", ":Format<CR>", mode = "", default_opts },
  },
}
