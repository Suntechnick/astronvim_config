return {
  "shortcuts/no-neck-pain.nvim",
  as = "no-neck-pain",
  cmd = "NoNeckPain",
  config = function() require("no-neck-pain").setup { width = 115 } end,
}
