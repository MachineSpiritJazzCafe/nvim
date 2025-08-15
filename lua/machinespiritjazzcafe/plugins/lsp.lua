return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
    -- Language servers for your workflow
        ensure_installed = {
          "pyright",        -- Python
          "clangd",         -- C/C++/CUDA
          "lua_ls",         -- Lua (for Neovim config)
          "bashls",         -- Bash
          "jsonls",         -- JSON
          "yamlls",         -- YAML
        }
      }
  },
  
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Setup language servers
      lspconfig.pyright.setup({})      -- Python
      lspconfig.clangd.setup({})       -- C/C++/CUDA
      lspconfig.lua_ls.setup({})       -- Lua
      lspconfig.bashls.setup({})       -- Bash
      lspconfig.jsonls.setup({})       -- JSON
      lspconfig.yamlls.setup({})       -- YAML
      
      -- LSP keybinds
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
    end,
  },
}
