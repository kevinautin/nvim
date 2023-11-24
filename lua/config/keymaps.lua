-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
-- Delete a keymap
-- vim.keymap.del(mode, lhs, opts)

-- Neogit
map("n", "<leader>gn", require("neogit").open, { desc = "Neogit" })

-- Gitsigns
local gs = require("gitsigns")
map("n", "<leader>gb", function()
  gs.blame_line({ full = true })
end, { desc = "Blame Line" })
map("n", "<leader>gd", gs.diffthis, { desc = "Diff This" })
map("n", "<leader>gD", function()
  gs.diffthis("~")
end, { desc = "Diff This ~" })
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk" })

-- Telescope
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "commits" })
-- map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "status" })

-- Better movements
map({ "n", "o", "x" }, "gl", "$", { desc = "End of line" })
map({ "n", "o", "x" }, "gh", "^", { desc = "Start of line" })
map({ "n", "o", "x" }, "gj", "G", { desc = "End of file" })
map({ "n", "o", "x" }, "gk", "gg", { desc = "Start of file" })

-- Oil
-- map({ "n", "o", "x" }, "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map({ "n", "o", "x" }, "<leader>fo", "<CMD>Oil<CR>", { desc = "Open parent directory" })
