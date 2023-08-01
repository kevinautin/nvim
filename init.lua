-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.scrolloff = 200 -- Lines of context
opt.wrap = false -- Disable line wrap
