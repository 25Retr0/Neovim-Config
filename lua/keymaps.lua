-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>wq", ":wq<CR>")       -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>")       -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>")        -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
keymap.set("v", "p", '"_dP', opts)

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width
keymap.set("n", "<leader>sq", ":close<CR>") -- close split window
keymap.set("n", "<leader>wj", "<C-w>-")     -- make split window height shorter
keymap.set("n", "<leader>wk", "<C-w>+")     -- make split windows height taller
keymap.set("n", "<leader>wl", "<C-w>>5")    -- make split windows width bigger
keymap.set("n", "<leader>wh", "<C-w><5")    -- make split windows width smaller

-- Navigate between splits
keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Diagnostic Window
keymap.set("n", "<leader>ds", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Netrw keymaps
keymap.set("n", "<leader>fe", ":Ex<CR>", { desc = 'Open netrw explorer' })

-- Sessions
function trim(s)
  return s:match("^%s*(.*%S?)%s*$") or ""
end

keymap.set("n", "<leader>mcs", function()
    local session_name = vim.fn.input("Workspace name: ")

    if trim(session_name) == "" then
        vim.notify("Error: Empty name")
        return
    end
    vim.cmd(":mksession! " .. session_name .. ".session")
end, { desc = "Make new workspace" }) -- New Workspace / Session

keymap.set("n", "<leader>mos", function()
    local session_name = vim.fn.input("Workspace name: ")

    if trim(session_name) == "" then
        vim.notify("Error: Empty name")
        return
    end
    vim.cmd(":source " .. session_name .. ".session")
end, { desc = "Open workspace" }) -- Open Workspace / Session

