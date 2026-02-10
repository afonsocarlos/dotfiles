P = function(v)
    print(vim.inspect(v))
    return v
end

_G.CloseAllFloatingWindows = function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then        -- is_floating_window?
      vim.api.nvim_win_close(win, false) -- do not force
    end
  end
end

vim.ui.open = (function(overridden)
  return function(path)
    vim.validate({
      path = { path, 'string' },
    })
    local is_uri = path:match('%w+:')
    local is_half_url = path:match('%.com%f[%W]')
    local is_repo = vim.bo.filetype == 'lua' and path:match('%w/%w') and vim.fn.count(path, '/') == 1
    local is_dir = path:match('/%w')
    if not is_uri then
      if is_half_url then
        path = ('https://%s'):format(path)
      elseif is_repo then
        path = ('https://github.com/%s'):format(path)
      elseif not is_dir then
        path = ('https://duckduckgo.com/?q=%s'):format(path)
      end
    end
    overridden(path)
  end
end)(vim.ui.open)
