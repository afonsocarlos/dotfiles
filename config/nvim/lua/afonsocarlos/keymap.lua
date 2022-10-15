local M = {}

local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force",
      outer_opts,
      opts or {}
    )
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

M.nmap = bind("n", { remap = true })
M.xmap = bind("x", { remap = true })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")

TelescopeKeymapArgs = TelescopeKeymapArgs or {}
M.telescope_nmap = function (key, f, options)
  local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

  TelescopeKeymapArgs[map_key] = options or {}

  local rhs = string.format(":lua require('telescope.builtin')['%s'](TelescopeKeymapArgs['%s'])<CR>", f, map_key)


  M.nnoremap(key, rhs, { silent = true })
end

return M
