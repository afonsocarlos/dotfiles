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
        lualine_a = { "buffers" },
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
