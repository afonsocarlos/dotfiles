local M = {}

M.setup = function()
  local ai = require("mini.ai")
  ai.setup({
    custom_textobjects = {
      a = ai.gen_spec.argument({ separator = ",%s*" }),
      b = { { "%b()" }, "^.().*().$" },
      c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
      f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
      F = ai.gen_spec.treesitter({ a = "@function.full", i = "@function.inner" }),
      g = function()
        local from = { line = 1, col = 1 }
        local to = {
          line = vim.fn.line("$"),
          col = math.max(vim.fn.getline("$"):len(), 1),
        }
        return { from = from, to = to }
      end,
    },
    n_lines = 500,
    search_method = "cover_or_nearest",
  })
end

return M
