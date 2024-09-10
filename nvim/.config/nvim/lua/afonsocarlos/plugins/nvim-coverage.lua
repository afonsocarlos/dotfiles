local toggle_coverage = function ()
  local coverage = require("coverage")
  local coverage_signs = require("coverage.signs")

  if not coverage_signs.is_enabled() then
    coverage.load(true)
  else
    coverage.clear()
  end
end

return {
  "andythigpen/nvim-coverage",
  dependencies = { "nvim-lua/plenary.nvim", "asb/lua-xmlreader" },
  config = {
    auto_reload = true,
    auto_reload_timeout_ms = 1000,
  },
  keys = {
    { "<leader>tc", toggle_coverage, silent = true },
  }
}
