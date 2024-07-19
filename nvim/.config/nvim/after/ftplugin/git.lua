local cherry_pick = function ()
  local line = vim.fn.getline(".")
  local commit = line:match("%f[%x]%x%x%x%x%x%x%x")
  vim.cmd("keepalt Git cherry-pick " .. commit)
end

vim.keymap.set("n", "cp", cherry_pick, { buffer = 0, silent = true })
