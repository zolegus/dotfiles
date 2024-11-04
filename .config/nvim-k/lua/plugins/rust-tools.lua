return {
  "simrat39/rust-tools.nvim",
  config = function()
    local rt = require("rust-tools")

    rt.setup({
      server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              allFeatures = true,
              buildScripts = {
                enable = true,
              },
              procMacro = {
                enable = true,
              }
            },
            checkOnSave = {
              allFeatures = true,
              enable = true
            }
          },
        },
      },
    })
  end,
}
