local quickfix_count = function()
  local qf_values = vim.fn.getqflist({ idx = 0, size = 0 })
  local qf_loc_label = ""
  if qf_values.size > 0 then
    qf_loc_label = ("Qf: [%s/%s]"):format(qf_values.idx, qf_values.size)
  end
  local loc_values = vim.fn.getloclist(0, { idx = 0, size = 0 })
  if loc_values.size > 0 then
    qf_loc_label = ("%s Loc: [%s/%s]"):format(qf_loc_label, loc_values.idx, loc_values.size)
  end
  return qf_loc_label
end

local spell = function()
  return vim.wo.spell and ("Spell: %s"):format(vim.bo.spelllang) or ""
end

-- Status line enhancement
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "yamatsum/nvim-web-nonicons",
  },
  config = function()
    local icons = require("nvim-nonicons")

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = "|",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = {
          { "branch", icon = icons.get("git-branch") },
          "diff",
          "diagnostics",
        },
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = {
          { quickfix_count },
          {
            "searchcount",
            maxcount = 9999,
            timeout = 500,
          },
          "encoding",
          "fileformat",
        },
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { spell },
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = {
          {
            "buffers",
            filetype_names = {
              fugitive = "Git",
            },
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          "navic",
          color_correction = nil,
          navic_opts = nil,
        },
        lualine_z = { "tabs" },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = { "nvim-tree", "quickfix", "fugitive", "lazy", "man" },
    })
  end,
}
