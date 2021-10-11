require('bufferline').setup{
  options = {
    view = 'default',
    numbers = 'ordinal',
    number_style = "",
    mappings = true,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      if context.buffer:current() then
        return ''
      end

      local icon = level:match('error') and ' ' or ' '
      return ' ' .. icon .. count
    end,
    show_buffer_close_icons = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = 'thin',  --
    enforce_regular_tabs = false,  -- | true,
    always_show_bufferline = true,  -- | false,
    sort_by = 'extension',  -- | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
      -- add custom logic
      -- return buffer_a.modified > buffer_b.modified
    -- end
  },
  highlights = {
      buffer_selected = {
        guifg = '#f0f0f0',
        gui = 'italic'
      },
      modified_selected = {
        guifg = '#e5c07b'
      },
      pick = {
        gui = 'italic'
      }
  }
}
