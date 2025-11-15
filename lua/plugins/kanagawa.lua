return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "wave", -- choose from "wave", "dragon", "lotus"
        transparent = false,
      })
    end,
  },
}
