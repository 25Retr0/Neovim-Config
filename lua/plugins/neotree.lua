return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- optional, can keep for colored filetypes even without nerd fonts
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>p', '<cmd>Neotree toggle<cr>', desc = 'Toggle Neotree' },
    { '<leader>o', '<cmd>Neotree focus<cr>',  desc = 'Focus Neotree' },
  },
  config = function()
    require('neo-tree').setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        width = 30,
        mappings = {
          ['<space>'] = 'none',
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = false,
        },
        window = {
          mappings = {
            ["C"] = "set_root",
            ["u"] = "navigate_up",
          },
        },
      },
    })
  end,
}
