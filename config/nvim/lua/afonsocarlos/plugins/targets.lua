
-- Provides additional text objects
return {
  "wellle/targets.vim",
  config = function ()

    vim.g.targets_seekRanges = "cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA"

    -- Make targets.vim use default braces
    vim.api.nvim_create_autocmd("User", {
      group = vim.api.nvim_create_augroup("targets_default", { clear = true }),
      pattern = "targets#mappings#user",
      command = [[
        call targets#mappings#extend({ 'a': {'argument': [{'o': '[{([]', 'c': '[])}]', 's': ','}]}, 'b': {'pair': [{'o':'(', 'c':')'}]} })
      ]]
    })
  end
}
