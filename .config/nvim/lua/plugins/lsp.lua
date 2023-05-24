----=====##### Language Server Protocols
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- local lspconfig = require('lspconfig')
-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}
-- lspconfig.prismals.setup {}
-- lspconfig.cssls.setup {
--     capabilities = capabilities
-- }
-- lspconfig.golangci_lint_ls.setup {}
-- lspconfig.rust_analyzer.setup {
--   settings = {
--     ['rust-analyzer'] = {
--             diagnostics = {
--                 enable = true,
--                 experimental = {
--                     enable = true,
--                 },
--             },
--     },
--   },
-- }

local lsp = require('lsp-zero').preset("recommended")

lsp.ensure_installed({
    'lua_ls',
    'rust_analyzer',
    -- 'tsserver',
    -- 'eslint',
    -- 'gopls',
    -- 'bashls',
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- require('lspconfig').eslint.setup({
--   filestypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
--   settings = {
--     format = { enable = true },
--     lint = { enable = true },
--   },
-- })

lsp.skip_server_setup({
    'rust_analyzer',
    -- 'gopls' 
})
lsp.setup()

require("inlay-hints").setup({
    only_current_line = false,
    eol = {
        right_align = false,
    }
})


-----=====####### RUST
local ih = require("inlay-hints")
require("rust-tools").setup({
    server = {
        settings = {
            ["rust-analyzer"] = {
                check = {
                    command = "clippy",
                },
                cargo = {
                    loadOutDirsFromCheck = true,
                },
                lens = {
                    enable = true,
                },
                procMacro = {
                    enable = true,
                },
            },
        },
    },
    tools = {
        executor = require("rust-tools/executors").termopen,           -- can be quickfix or termopen
        reload_workspace_from_cargo_toml = true,
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = false,
            only_current_line = false,
            show_parameter_hints = false,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
        },
        hover_actions = {
            border = "rounded",
        },
        on_initialized = function()
            ih.set_all()

            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                pattern = { "*.rs" },
                callback = function()
                    local _, _ = pcall(vim.lsp.codelens.refresh)
                end,
            })
        end,
    },
})

require("crates").setup {
    null_ls = {
        enabled = true,
        name = "crates.nvim",
    },
    popup = {
        border = "rounded",
    },
}
