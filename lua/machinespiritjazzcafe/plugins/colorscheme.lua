return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup({
      -- Configuration options
      variant = 'auto', -- auto, main, moon, or dawn
      dark_variant = 'main', -- main, moon, or dawn
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = true,
      disable_float_background = false,
    })
    
    -- Set the colorscheme
    vim.cmd('colorscheme rose-pine')
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end,
}
