return {
  dir = "afonsocarlos/toggle.nvim",
  config = function()
    _G.toggle_checkbox = function(mode)
      local mark1 = mode == "visual" and "<" or "["
      local mark2 = mode == "visual" and ">" or "]"
      local startpos = vim.api.nvim_buf_get_mark(0, mark1)
      local endpos = vim.api.nvim_buf_get_mark(0, mark2)
      local lines = vim.fn.getline(startpos[1], endpos[1])

      local filler = nil
      for index, line in ipairs(lines) do
        local is_toggleable = line:match("^%s*%- %[([x%s]+)%]")

        if is_toggleable then
          filler = filler or is_toggleable == "x" and " " or "x"
          local toggled_line = line:gsub("^(%s*%- %[)[x%s]+(%])", "%1" .. filler .. "%2")
          vim.fn.setline(startpos[1] + index - 1, toggled_line)
        end
      end
    end

    vim.keymap.set("n", "<leader>x", ":set opfunc=v:lua.toggle_checkbox<CR>g@", { silent = true })
    vim.keymap.set("x", "<leader>x", ":<C-U>:lua toggle_checkbox('visual')<CR>", { silent = true })
    vim.keymap.set("n", "<leader>xx", "<leader>x_", { remap = true })
  end,
}
