
local map = vim.api.nvim_set_keymap

local config = {
  colorscheme = 'deep-space',

  polish = function ()
    map("n", "<a-1>", "<cmd>ToggleTermToggleAll<cr>", {})

    vim.api.nvim_command("language en_US")

    map("n", "<a-j>", ":m .+1<cr>==", {})   
    map("n", "<a-k>", ":m .-2<cr>==", {})
    map("i", "<a-j>", "<Esc>:m .+1<cr>==gi", {})
    map("i", "<a-k>", "<Esc>:m .-2<cr>==gi", {})
    map("v", "<a-j>", ":m '>+1<cr>gv=gv", {})
    map("v", "<a-k>", ":m '<-2<cr>gv=gv", {})
  end,
  
  plugins = {
    init = {
      { "romainl/flattened" },
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
              "typescriptreact"
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
