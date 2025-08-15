return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",    -- LSP completions
    "hrsh7th/cmp-buffer",      -- Buffer completions
    "hrsh7th/cmp-path",        -- Path completions
    "L3MON4D3/LuaSnip",        -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet completions
  },
  
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),      -- Force show completions
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept completion
        ["<Tab>"] = cmp.mapping.select_next_item(),  -- Next suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),     -- Scroll docs up
        ["<C-d>"] = cmp.mapping.scroll_docs(4),      -- Scroll docs down
      }),
      
      sources = cmp.config.sources({
        { name = "nvim_lsp" },    -- LSP completions (functions, variables)
        { name = "luasnip" },     -- Snippets
      }, {
        { name = "buffer" },      -- Words from current buffer
        { name = "path" },        -- File paths
      }),
    })
  end,
}
