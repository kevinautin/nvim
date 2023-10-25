-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.scrolloff = 200 -- Lines of context
opt.wrap = false -- Disable line wrap

-- mini.ai moves
local map_ai_move = function(lhs, textobject_id, direction, desc)
  local rhs = function()
    MiniAi.move_cursor("left", "a", textobject_id, { search_method = direction })
  end
  vim.keymap.set({ "n", "x", "o" }, lhs, rhs, { desc = desc })
end
-- Instead of `'f'` use id of textobject you'd like to move.
-- For more info see `:h MiniAi.move_cursor()`.
map_ai_move("[m", "f", "prev", "Jump to prev function")
map_ai_move("]m", "f", "next", "Jump to next function")

-- Automatically reload files changed outside vim
-- vim.cmd("set autoread | au CursorHold * checktime")

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable New Line Comment",
})

-- local augroup = vim.api.nvim_create_augroup("cmp_auto_at_the_beginning_of_line", { clear = true })
-- vim.api.nvim_create_autocmd("CursorMovedI", {
--   pattern = "*",
--   group = augroup,
--   callback = function()
--     local cmp = require("cmp")
--     local current_line = vim.fn.getline(vim.fn.line("."))
--     if current_line:match("^%s+$") and not cmp.visible() then
--       cmp.complete({ reason = "manual" })
--     end
--   end,
-- })
