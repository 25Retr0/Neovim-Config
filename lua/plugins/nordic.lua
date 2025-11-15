return {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local nordic = require("nordic")

        nordic.setup({
            bold_keywords = false,
            italic_comments = true,
            transparent = {
                bg = false,
                float = true,
            },
            bright_border = false,
            reduced_blue = true,
            cursorline = {
                bold = false,
                bold_number = true,
                theme = "dark",
                blend = 0.85,
            },
            noice = { style = "flat" },
            telescope = { style = "flat" },
            leap = { dim_backdrop = false },
            ts_context = { dark_background = true },
        })
    end,
}

