return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disabled_keys = {
        ["<Up>"] = {},
        ["<Down>"] = {},
      },
      disable_mouse = false,
      restriction_mode = "hint",
    },
  },
}
