return {
  "mbbill/undotree",
  
  config = function()
    -- Keybind to toggle undotree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
  end,
}
