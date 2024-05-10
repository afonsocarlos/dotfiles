return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "olimorris/neotest-phpunit",
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, vim.api.nvim_create_namespace("neotest"))
    require("neotest").setup({
      adapters = {
        require("neotest-phpunit")({
          filter_dirs = { "vendor" },
        }),
      },
      icons = {
        running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      },
      output = { open_on_run = true },
    })
  end,
  keys = {
    { "<leader>ta", ":lua require('neotest').run.run({ suite = true })<CR>", desc = "Run test suite", silent = true },
    { "<leader>td", ":lua require('neotest').run.run({ strategy = 'dap' })<CR>", desc = "Debug nearest test", silent = true },
    { "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Run all tests in file", silent = true },
    { "<leader>tl", ":lua require('neotest').run.run_last()<CR>", desc = "Run last test", silent = true },
    { "<leader>to", ":lua require('neotest').output.open({ enter = true })<CR>", desc = "Open test output", silent = true },
    { "<leader>tp", ":lua require('neotest').output_panel.toggle()<CR>", desc = "Open test output panel", silent = true },
    { "<leader>ts", ":lua require('neotest').summary.toggle({ enter = true })<CR>", desc = "Toggle test summary", silent = true },
    { "<leader>tt", ":lua require('neotest').run.run()<CR>", desc = "Run nearest test", silent = true },
  },
}
