local M = {}

M.setup = function()
  local ai = require("mini.ai")
  ai.setup({
    custom_textobjects = {
      a = ai.gen_spec.argument({ separator = ",%s*" }),
      b = { { "%b()" }, "^.().*().$" },
      B = { { "%b{}" }, "^.%s*().-()%s*.$" },
      f = false,
      ["{"] = false,
    },
    n_lines = 500,
    search_method = "cover_or_nearest",
  })
end

return M
