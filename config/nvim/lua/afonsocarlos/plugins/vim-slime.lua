-- Vim REPL slime
return {
  "jpalardy/vim-slime",
  config = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_no_mappings = 1
    vim.g.slime_default_config = {
      socket_name = "default",
      target_pane = "{last}"
    }
  end
}
