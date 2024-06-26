local conceal_todolist = function ()
  vim.api.nvim_set_hl(0, 'Conceal', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'todoCheckbox', { link = 'Todo' })

  vim.schedule(function()
    vim.cmd [[
      syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[\s\]'hs=e-4 conceal cchar=
      syntax match VimwikiListTodo '\v(\s+)?(-|\*)\s\[x\]'hs=e-4 conceal cchar=
    ]]
  end)
end

local conceal_emojis = function ()
  local items = require('cmp_emoji.items')
  local emojis = items()

  for _, emoji in ipairs(emojis) do
    vim.fn.matchadd('Conceal', emoji.word, 10, -1, { conceal = emoji.insertText })
  end
end

vim.opt_local.wrap = true
vim.opt_local.spell = true

conceal_todolist()

conceal_emojis()
