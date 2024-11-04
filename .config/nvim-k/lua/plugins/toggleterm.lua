return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      shading_factor = 2,
      open_mapping = [[<C-T>]],
      insert_mapping = true,
      terminal_mapping = true,
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
  end,
  keys = {
    {
      "<leader>t",
      "<cmd>ToggleTerm<CR>",
      desc = "Open a terminal",
    },
  },
}
