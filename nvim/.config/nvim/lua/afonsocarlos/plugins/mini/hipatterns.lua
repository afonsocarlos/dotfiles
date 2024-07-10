local M = {}

M.setup = function()
  local hipatterns = require("mini.hipatterns")
  hipatterns.setup({
    highlighters = {
      hex_color = hipatterns.gen_highlighter.hex_color(),
      fixme = { pattern = "%f[%w]FIXME%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]HACK%f[%W]", group = "MiniHipatternsHack" },
      note = { pattern = "%f[%w]NOTE%f[%W]", group = "MiniHipatternsNote" },
      todo = { pattern = "%f[%w]TODO%f[%W]", group = "MiniHipatternsTodo" },
    },
  })

  vim.api.nvim_create_user_command("TodoList", [[grep '\b(FIXME\|HACK\|NOTE\|TODO)\b' <args>]], {
    complete = "file",
    nargs = "?",
  })
end

return M
