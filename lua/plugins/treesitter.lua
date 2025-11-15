return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.install").compilers = { "clang", "gcc" }
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "python",
                    "javascript",
                    "lua",
                    "json",
                    "sql",
                    "java",
                    "vim",
                    "vimdoc",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
