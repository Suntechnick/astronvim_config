return {
  n = {
    ["<leader>i"] = { "<cmd>e ~/AppData/Local/nvim/lua/user/init.lua<cr>", desc = "Open AstroNvim init config" },
    ["<leader>rr"] = { "<cmd>Cargo run<cr>", desc = "Cargo run" },
    ["<leader>rt"] = { "<cmd>Cargo test<cr>", desc = "Cargo test" },
    ["<leader>rc"] = { "<cmd>Cargo check<cr>", desc = "Cargo check" },
    ["<C-u>"] = { "<C-u>zz", desc = "Scroll top and center view" },
    ["<C-d>"] = { "<C-d>zz", desc = "Scroll down and center view" },
    ["<leader>np"] = { "<cmd>NoNeckPain<cr>", desc = "No Neck Pain" },
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    s = { function() require("leap").leap { target_windows = { vim.fn.win_getid() } } end, desc = "Leap" },
  },
}
