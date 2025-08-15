-- Basic settings
vim.opt.number = true           -- Show absolute line numbers on the left
vim.opt.relativenumber = true   -- Show relative line numbers (current line shows absolute, others show distance)
vim.opt.tabstop = 4            -- How many spaces a tab character appears as
vim.opt.softtabstop = 4        -- Soft tab indents
vim.opt.shiftwidth = 4         -- How many spaces to use for each indentation level (when using >> or <<)
vim.opt.expandtab = true       -- Convert tabs to spaces when you press Tab key

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

