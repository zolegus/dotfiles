local h = require("null-ls.helpers")
local methods = require("null-ls.methods")
local u = require("null-ls.utils")

local FORMATTING = methods.internal.FORMATTING

local leptosfmt = h.make_builtin({
  name = "leptosfmt",
  meta = {
    url = "https://github.com/bram209/leptosfmt",
    description = "A formatter for the leptos view! macro"
  },
  method = FORMATTING,
  filetypes = { "rust" },
  generator_opts = {
    command = "leptosfmt",
    args = { "--quiet", "--stdin" },
    to_stdin = true,
  },
  factory = h.formatter_factory,
})


return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.terraform_fmt,
        --nls.builtins.formatting.yamlfmt,
        nls.builtins.formatting.deno_fmt.with({
          filetypes = { "markdown" }
        }),
        nls.builtins.formatting.golines,
        nls.builtins.formatting.goimports_reviser,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
        nls.builtins.formatting.taplo,
        nls.builtins.formatting.prettierd.with({
          filetypes = { "graphql" }
        }),
        nls.builtins.formatting.shfmt,
        nls.builtins.code_actions.gitsigns,
        nls.builtins.code_actions.refactoring,
        nls.builtins.formatting.rustfmt.with({
          extra_args = { "--edition=2021" },
          filetypes = { "rust" }
        }),
        leptosfmt.with({
          condition = function(utils)
            return utils.root_has_file({ "leptosfmt.toml" })
          end,
        }),
        nls.builtins.diagnostics.revive,
        nls.builtins.code_actions.impl,
        nls.builtins.code_actions.refactoring,
      },
    }
  end,
}
