return {
  "folke/todo-comments.nvim",
  as = "todo-comments",
  lazy = false,
  config = function() require("todo-comments").setup {} end,
}
