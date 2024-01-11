return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    local npairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')
    local utils = require('nvim-autopairs.utils')

    npairs.setup()

    local function multiline_close_jump(char)
      return Rule(char, '')
          :with_pair(function()
            local row, col = utils.get_cursor()
            local line = utils.text_get_current_line(vim.fn.bufnr())

            if #line ~= col then --not at EOL
              return false
            end

            local nextrow = row + 1
            if nextrow < vim.api.nvim_buf_line_count(0)
                and vim.regex("^\\s*" .. char):match_line(0, nextrow) then
              return true
            end
            return false
          end)
          :with_move(cond.none())
          :with_cr(cond.none())
          :with_del(cond.none())
          :set_end_pair_length(0)
          :replace_endpair(function()
            return '<esc>xwa'
          end)
    end

    npairs.add_rules {
      multiline_close_jump(')'),
      multiline_close_jump(']'),
      multiline_close_jump('}'),
    }
  end,
  opts = {} -- this is equalent to setup({}) function
}
