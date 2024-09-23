local M = {}

M.setup = function()
  local ai = require("mini.ai")
  ai.setup({
    custom_textobjects = {
      a = ai.gen_spec.argument({ separator = ",%s*" }),
      b = { { "%b()" }, "^.().*().$" },
      B = { { "%b{}" }, "^.%s*().-()%s*.$" },
      c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
      f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
      F = ai.gen_spec.treesitter({ a = '@function.full', i = '@function.inner' }),
      ["{"] = false,
    },
    n_lines = 500,
    search_method = "cover_or_nearest",
  })
end

return M
