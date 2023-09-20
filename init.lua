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
