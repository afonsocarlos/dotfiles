local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = '',

    -- file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    -- grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    -- qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ['<M-cr>'] = actions.send_selected_to_qflist,
        ['<C-q>'] = actions.send_to_qflist,
      },
      n = {
        ['<M-cr>'] = actions.send_selected_to_qflist,
        ['<C-q>'] = actions.send_to_qflist,
      },
    },
  },

  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    fzf_writer = {
        minimum_grep_characters = 2,
        minimum_files_characters = 2,
        use_highlighter = true,
    },
    -- fzy_native = {
    --   override_generic_sorter = false,
    --   override_file_sorter = true,
    -- }
  }
}

require('telescope').load_extension('fzf')
-- require('telescope').load_extension('fzy_native')
