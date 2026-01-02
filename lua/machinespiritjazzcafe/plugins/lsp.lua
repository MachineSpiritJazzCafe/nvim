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
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true
      })
      
      -- Setup language servers
      vim.lsp.config.pyright = {} -- Python
      vim.lsp.config.lua_ls  = {} -- Lua
      vim.lsp.config.bashls  = {} -- Bash
      vim.lsp.config.jsonls  = {} -- JSON
      vim.lsp.config.yamlls  = {} -- YAML

     -- Enhanced clangd setup for C/C++/CUDA
      vim.lsp.config.clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--query-driver=/usr/local/cuda/bin/nvcc",  -- Tell clangd about nvcc
          "--enable-config"
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_markers = {
          "compile_commands.json",
          ".clangd",
          ".git",
          "CMakeLists.txt",
          "Makefile"
        }
     }
     vim.lsp.enable({"pyright", "lua_ls", "bashls", "jasonls", "yamlls"})

      -- Set up file type associations for CUDA files
      vim.filetype.add({
        extension = {
          cu = "cuda",
          cuh = "cuda",
        },
      })


      -- LSP keybinds
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
    end,
  },
}
