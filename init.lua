local cmd = vim.api.nvim_command

local config = {
  colorscheme = 'tokyonight-night',

  polish = function()
    cmd("language en_US")
    cmd("set autoread")
    cmd("au CursorHold * checktime")
  end,

  options = {
    g = {
      rustfmt_autosave = 1,
    },
  },
  mappings = {
    n = {
      ["<a-1>"] = { "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle all opened terminals" },
      ["<a-j>"] = { ":m .+1<cr>==", desc = "Move bottom line at the cursor" },
      ["<a-k>"] = { ":m .-2<cr>==", desc = "Move up line at the cursor" },
      ["<leader>i"] = { "<cmd>e ~/AppData/Local/nvim/lua/user/init.lua<cr>", desc = "Open AstroNvim init config" },
      ["<leader>rr"] = { "<cmd>Cargo run<cr>", desc = "Cargo run" },
      ["<leader>rt"] = { "<cmd>Cargo test<cr>", desc = "Cargo test" },
    },
    i = {
      ["<a-j>"] = { "<Esc>:m .+1<cr>==gi", desc = "Move buttom line at the cursor" },
      ["<a-k>"] = { "<Esc>:m .-2<cr>==gi", desc = "Move up line at the cursor" }
    },
    v = {
      ["<a-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move bottom selected lines" },
      ["<a-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move up selected lines" },
    }
  },
  ['which-key'] = {
    register = {
      n = {
        ["<leader>"] = {
          r = { name = "Cargo" },
        },
      },
    },
  },
  plugins = {
    init = {
      { "rust-lang-nursery/rustfmt" },
      { "rust-lang/rust.vim" },
      { "folke/tokyonight.nvim" },
      { "tyrannicaltoucan/vim-deep-space" },
      {
        "ggandor/leap.nvim",
        config = function()
          require('leap').add_default_mappings()
        end
      },
      {
        "MunifTanjim/prettier.nvim",
        config = function()
          require('prettier').setup({
            bin = 'prettier',
            filetypes = {
              "css",
              "javascript",
              "javascriptreact",
              "scss",
              "typescript",
              "typescriptreact",
              "json"
            }
          })
        end
      },
      {
        "MunifTanjim/eslint.nvim",
        config = function()
          require('eslint').setup({})
        end
      }
    },
    heirline = function(config)
      config[1] = {
        hl = { fg = "fg", bg = "bg" },
        astronvim.status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
        astronvim.status.component.git_branch(),
        astronvim.status.component.file_info(),
        astronvim.status.component.git_diff(),
        astronvim.status.component.diagnostics(),
        astronvim.status.component.fill(),
        astronvim.status.component.lsp(),
        astronvim.status.component.treesitter(),
        astronvim.status.component.nav(),
      }
      config[2] = nil
      return config
    end,
    ["neo-tree"] = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        }
      }
    },
    ["toggleterm"] = {
      size = 80,
      direction = "vertical",
      shell = "powershell",
      close_on_exit = true,
    },
  }
}


return config
