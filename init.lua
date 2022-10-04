local cmd = vim.api.nvim_command

local config = {
  colorscheme = 'tokyonight-night',

  polish = function ()
    cmd("language en_US")
    cmd("set autoread")
    cmd("set guicursor=n-i-v-c:ver25-iCursor")
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
      ["<leader>r"] = { "<cmd>Cargo run<cr>", desc = "Cargo run" },
    },
    i = {
      ["<a-j>"] = { "<Esc>:m .+1<cr>==gi", desc = "Move buttom line at the cursor" },
      ["<a-k>"] = { "<Esc>:m .-2<cr>==gi", desc = "Move up line at the cursor" }
    },
    v = {
      ["<a-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move bottom selected lines" },
      ["<a-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move up selected lines" }
    }
  },
  -- TODO Remove this when filetype detection issue is fixed
  updater = {
    channel = "nightly",
    branch = "fix-filetype-detection",
    remote = "benvds",
    remotes = {
      ["benvds"] = "benvds/AstroNvim",
    },
  },

  lsp = {
    ['server-settings'] = {
      tsserver= {
        on_attach = function (client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end
      }
    }
  },

  plugins = {
    init = {
      { "rust-lang-nursery/rustfmt" },
      { "rust-lang/rust.vim" },
      { "folke/tokyonight.nvim" },
      { "tyrannicaltoucan/vim-deep-space" },
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
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      config.sources = {
        null_ls.builtins.formatting.prettier,
      }
      config.on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config
    end,
  }
}


return config
