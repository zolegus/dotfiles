return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      --flavour = "espresso"
      --flavour = "macchiato"
    })
  end
}
