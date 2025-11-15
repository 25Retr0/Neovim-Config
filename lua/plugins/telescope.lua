return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
    { '<leader>sf', function() require('telescope.builtin').find_files() end, desc = 'Find Files' },
    { '<leader>sg', function() require('telescope.builtin').live_grep() end, desc = 'Live Grep' },
    { '<leader>sb', function() require('telescope.builtin').buffers() end, desc = 'Buffers' },
    { '<leader>sh', function() require('telescope.builtin').help_tags() end, desc = 'Help Tags' },
    },
    config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-l>'] = require('telescope.actions').select_default,
          },
        },
        file_ignore_patterns = { 'target/.*', 'node_modules', '%.git', '%.venv' },
        hidden = true,
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      },
    }
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                }
            }
        })
        require("telescope").load_extension("ui-select")
    end
  }
}
