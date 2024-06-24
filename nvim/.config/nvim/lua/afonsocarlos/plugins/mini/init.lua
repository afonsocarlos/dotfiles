return {
  {
    "echasnovski/mini.ai",
    version = "*",
    config = function()
      local ai = require("mini.ai")
      ai.setup({
        custom_textobjects = {
          a = ai.gen_spec.argument({ separator = ",%s*" }),
          b = { { '%b()' }, '^.().*().$' },
          B = { { '%b{}' }, '^.%s*().-()%s*.$' },
          f = false,
          ["{"] = false,
        },
        n_lines = 500,
        search_method = "cover_or_nearest",
      })
    end,
  },
  {
    "echasnovski/mini.hipatterns",
    version = "*",
    config = function()
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
          fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
          hack = { pattern = "HACK", group = "MiniHipatternsHack" },
          todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
          note = { pattern = "NOTE", group = "MiniHipatternsNote" },
        },
      })
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    config = true,
  },
  {
    "echasnovski/mini.splitjoin",
    version = "*",
    config = true,
  },
}
