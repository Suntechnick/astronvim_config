return {
  "petertriho/nvim-scrollbar",
  as = "nvim-scrollbar",
  lazy = false,
  config = function()
    require("scrollbar").setup {
      marks = {
        GitAdd = {
          color = "#9ece6a",
        },
        GitChange = {
          color = "#e0af68",
        },
        GitDelete = {
          color = "#f7768e",
        },
      },
    }
  end,
}
