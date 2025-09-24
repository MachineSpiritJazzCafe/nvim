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

     -- Enhanced clangd setup for C/C++/CUDA
      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--query-driver=/usr/local/cuda/bin/nvcc",  -- Tell clangd about nvcc
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
        root_dir = lspconfig.util.root_pattern(
          "compile_commands.json",
          ".clangd",
          ".git",
          "CMakeLists.txt",
          "Makefile"
        ),
      
        -- Add CUDA-specific settings
        settings = {
          clangd = {
            arguments = {
              "-I/usr/local/cuda/include",
              "-D__CUDACC__",
              "-D__NVCC__",
              "--cuda-gpu-arch=sm_75",  -- using RTX 2070 super
            },
          },
        },
      })
      
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
