return {
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    config = function()
      local metals = require("metals")
      
      local metals_config = metals.bare_config()
      
      -- Explicitly tell nvim-metals where metals binary is
      metals_config.settings = {
        metals = {
          useGlobalExecutable = true,  -- Use system metals, not nvim-metals' copy
          showInferredType = true,
          showImplicitArguments = true
        },
      }      
      
      metals_config.on_attach = function(client, bufnr)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
        
        vim.keymap.set('v', '<leader>t', function()
            require('metals').type_of_range()
        end, { buffer = bufnr, desc = 'Show type of selection' })

    end

      local augroup = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt" },
        callback = function()
          metals.initialize_or_attach(metals_config)
        end,
        group = augroup,
      })
    end,
  },
}
