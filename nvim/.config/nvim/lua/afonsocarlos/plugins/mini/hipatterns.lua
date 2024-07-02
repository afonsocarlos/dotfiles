local M = {}

M.setup = function()
  local hipatterns = require("mini.hipatterns")
  hipatterns.setup({
    highlighters = {
      hex_color = hipatterns.gen_highlighter.hex_color(),
      fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
      hack = { pattern = "HACK", group = "MiniHipatternsHack" },
      note = { pattern = "NOTE", group = "MiniHipatternsNote" },
      todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
    },
  })

  vim.api.nvim_create_user_command("TodoList", [[grep '\b(FIXME\|HACK\|NOTE\|TODO)\b' <args>]], {
    complete = "file",
    nargs = "?",
  })
end

return M
