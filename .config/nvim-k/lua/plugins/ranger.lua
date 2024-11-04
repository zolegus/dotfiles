return {
  "kjuulh/ranger.nvim",
  config = function()
    require("ranger").setup()
  end,
  keys = {
    { "<leader>.", "<CMD>Ranger<CR>", "Opens the ranger file manager" },
  },
}
