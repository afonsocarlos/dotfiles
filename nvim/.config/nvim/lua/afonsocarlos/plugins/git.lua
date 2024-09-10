local close_diff = function()
  -- If we're in merge mode, exit it
  if vim.g.mergetool_in_merge_mode and vim.g.mergetool_in_merge_mode ~= 0 then
    vim.fn["mergetool#stop"]()
    return
  end

  -- When running as 'vimdiff' or 'vim -d', close both files and exit Vim
  if vim.g.is_started_as_vim_diff and vim.g.is_started_as_vim_diff ~= 0 then
    vim.cmd([[windo quit]])
    return
  end

  -- If current window is in diff mode, close all diff windows
  if vim.opt.diff:get() then
    -- close all windows but first one
    local windows = vim.api.nvim_tabpage_list_wins(0)
    table.sort(windows)
    table.remove(windows, 1)

    for _, win in ipairs(windows) do
      if vim.api.nvim_get_option_value("diff", { win = win }) then
        vim.api.nvim_win_close(win, true)
      end
    end

    vim.cmd([[diffoff!]])
  end
end

local toggle_diff_option = function(option)
  local status
  if vim.list_contains(vim.opt.diffopt:get(), option) then
    status = "off"
    vim.opt.diffopt:remove(option)
  else
    status = "on"
    vim.opt.diffopt:append(option)
  end
  vim.notify(option .. " " .. status)
end

local run_async = function(cmd)
  return function()
    vim.system(cmd, { text = true }, function(obj)
      local msg = string.len(obj.stderr) > 0 and obj.stderr or obj.stdout
      vim.schedule(function() vim.notify(msg) end)
    end)
  end
end

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "samoshkin/vim-mergetool", -- Efficient way of using Vim as a Git mergetool
  },
  config = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "GitSignsChanged",
      group = vim.api.nvim_create_augroup("update_fugitive_after_gitsigns_action", { clear = true }),
      callback = function ()
        for _, window in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          local buf = vim.api.nvim_win_get_buf(window)
          local bufname = vim.api.nvim_buf_get_name(buf)
          if vim.startswith(bufname, 'fugitive://') then
            vim.api.nvim_buf_call(buf, function()
              vim.cmd.doautocmd('BufReadCmd')
            end)
          end
        end
      end,
      desc = "Update fugitive when staging/unstaging hunks",
    })

    require("gitsigns").setup({
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      current_line_blame_formatter = "  <author> • <author_time:%R> • <summary>",
      signs_staged_enable = false,

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        vim.g.mergetool_layout = "mr"
        vim.g.mergetool_prefer_revision = "local"

        -- Navigation
        vim.keymap.set("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.nav_hunk('next', { navigation_message = true }) end)
          return "<Ignore>"
        end, { expr = true })

        vim.keymap.set("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.nav_hunk('prev', { navigation_message = true }) end)
          return "<Ignore>"
        end, { expr = true })

        -- Diff View Shortcuts
        vim.keymap.set("n", "gq", function()
          if not vim.opt.diff:get() then return "gq" end
          vim.schedule(function() close_diff() end)
          return "<Ignore>"
        end, { expr = true })

        vim.keymap.set("n", "gw", function()
          if not vim.opt.diff:get() then return "gw" end
          vim.schedule(function() toggle_diff_option("iwhite") end)
          return "<Ignore>"
        end, { expr = true })

        vim.keymap.set("n", "gW", function()
          if not vim.opt.diff:get() then return "gW" end
          vim.schedule(function() toggle_diff_option("iwhiteall") end)
          return "<Ignore>"
        end, { expr = true })
      end,
    })
  end,
  keys = {
    -- Gitsigns Shortcuts
    { "[C", ":Gitsigns nav_hunk first navigation_message=true<CR>", mode = { "n", "v" }, silent = true },
    { "]C", ":Gitsigns nav_hunk last navigation_message=true<CR>", mode = { "n", "v" }, silent = true },
    { "<leader>hs", ":Gitsigns stage_hunk<CR>", mode = { "n", "v" }, silent = true },
    { "<leader>hu", ":Gitsigns reset_hunk<CR>", mode = { "n", "v" }, silent = true },
    { "<leader>hS", ":Gitsigns stage_buffer<CR>", silent = true },
    { "<leader>hU", ":Gitsigns reset_buffer<CR>", silent = true },
    { "<leader>hr", ":Gitsigns undo_stage_hunk<CR>", silent = true },
    { "<leader>hp", ":Gitsigns preview_hunk<CR>", silent = true },
    { "<leader>hP", ":Gitsigns preview_hunk_inline<CR>", silent = true },
    { "<leader>hb", ":Gitsigns blame_line<CR>", silent = true },
    { "<leader>hB", ":Gitsigns blame_line full=true<CR>", silent = true },
    { "<leader>ht", ":Gitsigns toggle_current_line_blame<CR>", silent = true },
    { "<leader>htd", ":Gitsigns toggle_deleted<CR>", silent = true },

    -- Fugitive Shortcuts
    { "<leader>hd", ":Gdiffsplit<CR>", silent = true },
    { "<leader>hD", ":Gdiffsplit @<CR>", silent = true },
    { "<leader>gb", ":G blame<CR>", silent = true },
    { "<leader>gca", ":bot G commit --verbose --all<CR>", silent = true },
    { "<leader>gcc", ":bot G commit --verbose<CR>", silent = true },
    { "<leader>gl", run_async({ "git", "pull" }), silent = true },
    { "<leader>gL", run_async({ "git", "pull", "--rebase" }), silent = true },
    { "<leader>gp", run_async({ "git", "push", "-u" }), silent = true },
    { "<leader>gP", run_async({ "git", "push", "-u", "--force-with-lease" }), silent = true },
    { "<leader>gs", ":G<CR>", silent = true },

    { "<leader>hc", "<plug>(MergetoolToggle)", silent = true },
    { "<leader>hct", ":call mergetool#toggle_layout('mr,b')<CR>", silent = true },
  },
}
