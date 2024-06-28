local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local opts = {
  dev = {
    path = "~/dev/nvim-plugins",
  },
  -- defaults = {
  --   lazy = true
  -- }
  change_detection = {
    -- automatically check for config file changes and reload the ui
    notify = false, -- get a notification when changes are found
  },
}

require("lazy").setup("afonsocarlos.plugins", opts)
