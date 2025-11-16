vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles'
-- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)

-- Use 2 spaces for HTML and JSX/TSX
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "javascriptreact", "typescriptreact" },
  callback = function()
    vim.opt_local.shiftwidth = 2  -- number of spaces for autoindent
    vim.opt_local.tabstop = 2     -- number of spaces for a <Tab>
    vim.opt_local.softtabstop = 2 -- number of spaces when pressing Tab
    vim.opt_local.expandtab = true -- use spaces instead of tab characters
  end,
})

require("options");
require("keymaps");
require("config.lazy");

-- Show Inline Messages
vim.diagnostic.config({
  virtual_text = true, -- enable inline messages
})

vim.cmd.colorscheme("nordic")
