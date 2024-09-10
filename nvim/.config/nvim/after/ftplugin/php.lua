vim.opt_local.commentstring = "// %s"
vim.opt_local.makeprg = "vendor/bin/phpunit"
vim.opt.errorformat:append("%E%n)\\ %.%#,%Z%f:%l,%C%m,%C,%-G%.%#")
-- create vim errorformat for parsing phpunit results

local has_mini_splitjoin, MiniSplitjoin = pcall(require, "mini.splitjoin")

if not has_mini_splitjoin then
  return
end

local gen_hook = MiniSplitjoin.gen_hook
local brackets = { brackets = { "%b()", "%b[]" } }

local add_comma_brackets = gen_hook.add_trailing_separator(brackets)
local del_comma_brackets = gen_hook.del_trailing_separator(brackets)

-- Create buffer-local config
vim.b.minisplitjoin_config = {
  split = { hooks_post = { add_comma_brackets } },
  join = { hooks_post = { del_comma_brackets } },
}

vim.b.test_coverage_cmd = { "vendor/bin/phpunit", "--coverage-cobertura", "coverage/cobertura.xml" }
vim.b.test_coverage_env = { XDEBUG_MODE = "coverage" }


-- -- Automatically fold private functions
local ufo = require('ufo')
local bufnr = vim.api.nvim_get_current_buf()

-- make sure buffer is attached
vim.wait(100, function() ufo.attach(bufnr) end)
if ufo.hasAttached(bufnr) then
  -- getFolds returns a Promise if providerName == 'lsp', use vim.wait in this case
  local ok, promise = pcall(ufo.getFolds, bufnr, 'lsp')
  if ok and promise then
    promise:thenCall(function (ranges)
      if ufo.applyFolds(bufnr, ranges) then
        ufo.openAllFolds()

        vim.cmd([[silent! keeppatterns g/\(private function\_.\{-}\)\@<={/norm! +zc]])
        -- vim.cmd([[silent! keeppatterns g/private function/foldclose]])
      end
    end):catch(function (err)
      vim.notify(err, vim.log.levels.ERROR)
    end)
  end
end
