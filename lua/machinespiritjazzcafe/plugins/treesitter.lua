return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Languages for your CUDA workflow
      ensure_installed = {
        -- Core languages
        "python",
        "c",
        "cpp", 
        "cuda",
        
        -- Configuration & data
        "lua",           -- Neovim config
        "vim",           -- Vim script
        "json",          -- Config files
        "yaml",          -- Config files
        "toml",          -- Python pyproject.toml
        
        -- Development essentials
        "bash",          -- Shell scripts
        "cmake",         -- Build files
        "make",          -- Makefiles
        "dockerfile",    -- Containers
        
        -- Documentation
        "markdown",      -- README files
        "markdown_inline",
        "rst",           -- Python docs
        
        -- Git & regex
        "git_config",
        "gitcommit",
        "gitignore",
        "regex",
      },
      
      -- Enable features
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental = "<C-backspace>",
        },
      },
    })
  end,
}
