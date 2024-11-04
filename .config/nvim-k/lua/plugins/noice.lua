return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          --find = "written"
        },
        opts = {
          skip = true
        }
      }
    }
  }
}
