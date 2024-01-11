vim.opt_local.textwidth = 120

vim.opt_local.shiftwidth = 2
vim.opt_local.formatoptions:remove({ "o" })

MiniSplitjoin = MiniSplitjoin or require("mini.splitjoin")

if MiniSplitjoin == nil then
  return
end

local gen_hook = MiniSplitjoin.gen_hook
local curly = { brackets = { "%b{}" } }

local add_comma_curly = gen_hook.add_trailing_separator(curly)
local del_comma_curly = gen_hook.del_trailing_separator(curly)
local pad_curly = gen_hook.pad_brackets(curly)

-- Create buffer-local config
vim.b.minisplitjoin_config = {
  split = { hooks_post = { add_comma_curly } },
  join = { hooks_post = { del_comma_curly, pad_curly } },
}
