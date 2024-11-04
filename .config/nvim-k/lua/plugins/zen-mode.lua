return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      plugins = {
        kitty = {
          enabled = true
        }
      }
    }
  end,
  keys = { { "<leader>wz", "<cmd>ZenMode<cr>", desc = "Toggle zen mode" } },
}
