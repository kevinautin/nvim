return {
  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disabled_keys = {
        ["<Up>"] = {},
        ["<Down>"] = {},
        ["<Right>"] = {},
        ["<Left>"] = {},
        ["h"] = {},
        ["j"] = {},
        ["k"] = {},
        ["l"] = {},
      },
      disable_mouse = false,
      restriction_mode = "hint",
    },
  },
}
