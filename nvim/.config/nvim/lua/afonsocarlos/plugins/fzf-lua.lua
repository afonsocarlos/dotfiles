return {
  "ibhagwan/fzf-lua",
  lazy = false,
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local fzf_lua = require("fzf-lua")

    require('fzf-lua').setup({
      keymap  = {
        builtin = {
          true,
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
        },
        fzf = {
          true,
          ["ctrl-d"] = "preview-page-down",
          ["ctrl-u"] = "preview-page-up",
          ["ctrl-q"] = "select-all+accept",
        },
      },
      actions = {
        files = {
          true,
          ["ctrl-x"] = fzf_lua.actions.file_split,
          ["alt-q"]  = fzf_lua.actions.file_sel_to_qf,
        },
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case -g '!{.git,node_modules}/*' --max-columns=4096 -e",
        hidden = true,
        actions = {
          ["alt-i"] = { fzf_lua.actions.toggle_ignore }
        },
      }
    })

    require('fzf-lua').register_ui_select(function(opts, items)
      local min_h, max_h = 0.15, 0.70
      local h = (#items + 4) / vim.o.lines
      if h < min_h then
        h = min_h
      elseif h > max_h then
        h = max_h
      end
      opts.title = opts.title or 'Select'

      return { winopts = { title = opts.title, height = h, width = 0.60, row = 0.40, relative = "cursor", preview = { hidden = true } } }
    end)
  end,
  keys = {
    { "<leader>f/", ":FzfLua blines<CR>", silent = true },
    { "<leader>fa", ":FzfLua grep_cword<CR>", silent = true },
    { "<leader>fA", ":FzfLua grep_cWORD<CR>", silent = true },
    { "<leader>fa", ":FzfLua grep_visual<CR>", mode = "v", silent = true },
    { "<leader>fb", ":FzfLua buffers<CR>", silent = true },
    { "<leader>fc", ":FzfLua git_branches<CR>", silent = true },
    { "<leader>fd", ":FzfLua diagnostics_workspace<CR>", silent = true },
    { "<leader>ff", ":FzfLua files<CR>", silent = true },
    { "<leader>fg", ":FzfLua live_grep_glob<CR>", silent = true },
    { "<leader>fh", ":FzfLua helptags<CR>", silent = true },
    { "<leader>fl", ":FzfLua git_bcommits<CR>", silent = true },
    { "<leader>fo", ":FzfLua oldfiles<CR>", silent = true },
    { "<leader>fq", ":FzfLua grep_quickfix<CR>", silent = true },
    { "<leader>fr", ":FzfLua resume<CR>", silent = true },
    { "<leader>ft", ":FzfLua<CR>", silent = true },
  }
}
