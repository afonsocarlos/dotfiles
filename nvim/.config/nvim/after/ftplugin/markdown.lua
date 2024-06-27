local conceal_todolist = function()
  vim.api.nvim_set_hl(0, "Conceal", { bg = "NONE" })

  vim.fn.matchadd("Conceal", "^\\s*\\zs- \\[ \\]", 10, -1, { conceal = "" })
  vim.fn.matchadd("Conceal", "^\\s*\\zs- \\[x\\]", 10, -1, { conceal = "" })
end

local conceal_emojis = function()
  local items = require("cmp_emoji.items")
  local emojis = items()

  for _, emoji in ipairs(emojis) do
    vim.fn.matchadd("Conceal", emoji.word, 10, -1, { conceal = emoji.insertText })
  end
end

vim.opt_local.wrap = true
vim.opt_local.spell = true

conceal_todolist()

conceal_emojis()
