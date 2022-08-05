-- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
-- table.insert(parser_config.javascript.used_by, 'vue')

require('nvim-treesitter.configs').setup{
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    indent = true
  }
}
