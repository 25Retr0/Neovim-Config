return {
    -- Mason: manage LSP servers
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason-LSPConfig: auto-install LSPs
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "html",
                    "cssls",
                },
            })
        end,
    },

    {
        "mfussenegger/nvim-jdtls",
        ft = "java",   -- only load for Java files (good for performance)
    },

    -- LSPConfig
    {
        "neovim/nvim-lspconfig",
        version = "v1.4.0",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            -- --- MANUAL TS/JS LSP SETUP ---
            -- Disable LazyVim's auto ts_ls loading
            vim.g.loaded_ts_ls = true

            -- Lua LSP
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            -- Pyright
            lspconfig.pyright.setup({
                capabilities = capabilities
            })

            -- HTML
            lspconfig.html.setup({
                capabilities = capabilities
            })

            -- CSS
            lspconfig.cssls.setup({
                capabilities = capabilities
            })

            -- TypeScript / JavaScript LSP (safe)
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                cmd = { "typescript-language-server", "--stdio" },
                root_dir = function(fname)
                    if type(fname) ~= "string" or fname == "" then
                        fname = vim.api.nvim_buf_get_name(0)
                    end
                    local root_files = { "package.json", "tsconfig.json", ".git" }
                    local found = vim.fs.find(root_files, {
                        upward = true,
                        path = fname,
                        stop = vim.loop.os_homedir(),
                    })[1]
                    if found then
                        return vim.fs.dirname(found)
                    end
                    return vim.loop.cwd()
                end,
                single_file_support = true,
            })

            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.api.nvim_buf_set_keymap(0, 'n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })
        end,
    },
}
