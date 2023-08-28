----=====##### Neodev setup
-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
	library = {
		enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
		-- these settings will be used for your Neovim config directory
		runtime = true, -- runtime path
		types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
		plugins = true, -- installed opt or start plugins in packpath
		-- you can also specify the list of plugins to make available as a workspace library
		-- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
	},
	setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
	-- for your Neovim config directory, the config.library settings will be used as is
	-- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
	-- for any other directory, config.library.enabled will be set to false
	override = function(root_dir, options) end,
	-- With lspconfig, Neodev will automatically setup your lua-language-server
	-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
	-- in your lsp start options
	lspconfig = true,
	-- much faster, but needs a recent built of lua-language-server
	-- needs lua-language-server >= 3.6.0
	pathStrict = true,
	-- add any options here, or leave empty to use the default settings
})

-- neodev.setup({
--     library = { plugins = { "nvim-dap-ui" }, types = true },
-- })

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
-- settings = {
-- ['rust-analyzer'] = {
-- diagnostics = {
--                 enable = true,
--                 experimental = {
--                     enable = true,
--                 },
--             },
--     },
--   },
-- }
local icons = require("core.icons")
-- local signs = {
--     { name = "DiagnosticSignError", text = icons.astro.DiagnosticError, texthl = "DiagnosticSignError" },
--     { name = "DiagnosticSignWarn", text = icons.astro.DiagnosticWarn, texthl = "DiagnosticSignWarn" },
--     { name = "DiagnosticSignHint", text = icons.astro.DiagnosticHint, texthl = "DiagnosticSignHint" },
--     { name = "DiagnosticSignInfo", text = icons.astro.DiagnosticInfo, texthl = "DiagnosticSignInfo" },
--     { name = "DapStopped", text = icons.astro.DapStopped, texthl = "DiagnosticWarn" },
--     { name = "DapBreakpoint", text = icons.astro.DapBreakpoint, texthl = "DiagnosticInfo" },
--     { name = "DapBreakpointRejected", text = icons.astro.DapBreakpointRejected, texthl = "DiagnosticError" },
--     { name = "DapBreakpointCondition", text = icons.astro.DapBreakpointCondition, texthl = "DiagnosticInfo" },
--     { name = "DapLogPoint", text = icons.astro.DapLogPoint, texthl = "DiagnosticInfo" },
-- }

vim.diagnostic.config({
	-- virtual_text = { prefix = icons.ui.BoldDividerLeft },
	virtual_text = { prefix = icons.ui.TriangleShortArrowLeft },
	signs = true, --{ active = signs },
	underline = true,
	update_in_insert = true, -- updated diagnostics until you leave insert mode
	severity_sort = true,
})

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- local on_attach = require
-- local lspconfig = require('lspconfig')
-- lspconfig['lua_ls'].setup {
--    capabilities = capabilities,
--    on_attach = on_attach,
-- }

local lsp = require("lsp-zero").preset("recommended")
lsp.ensure_installed({
	"lua_ls",
	"rust_analyzer",
	-- 'tsserver',
	-- 'eslint',
	-- 'gopls',
	-- 'bashls',
})
lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

-- require('lspconfig').eslint.setup({
--   filestypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
--   settings = {
--     format = { enable = true },
--     lint = { enable = true },
--   },
-- })

-- local on_attach = function(client)
-- require("completion").on_attach(client)
-- require("lsp.lsp-attach").on_attach()
-- end
--
-- require('lspconfig').rust_analyzer.setup({
-- capabilities = capabilities,
-- on_attach = on_attach,
-- settings = {
--         ['rust-analyzer'] = {
--             diagnostics = {
--                 enable = true,
--                 experimental = {
--                     enable = true,
--                 },
--             },
--         },
--     },
-- })

lsp.skip_server_setup({
	"rust_analyzer",
})
lsp.setup()

require("inlay-hints").setup({
	only_current_line = false,
	eol = {
		right_align = false,
	},
})

-----=====####### RUST ###############################
local ih = require("inlay-hints")
vim.api.nvim_set_hl(0, "RustInlayHints", { fg = "#313244" })
require("rust-tools").setup({
	server = {
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
				},
				runnables = {
					-- cargoExtraArgs = { "--release" },
				},
				cargo = {
					autoReload = true,
					allFeatures = true,
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
		executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
		reload_workspace_from_cargo_toml = true,
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			only_current_line = false,
			show_parameter_hints = false,
			parameter_hints_prefix = "<-",
			other_hints_prefix = "=>",
			max_len_align = false,
			max_len_align_padding = 1,
			right_align = false,
			right_align_padding = 7,
			highlight = "InlayHints",
			-- highlight = "RustInlayHints",
		},
		hover_actions = {
			border = "rounded",
			-- the border that is used for the hover window
			-- see vim.api.nvim_open_win()
			-- border = {
			--     { "╭", "FloatBorder" },
			--     { "─", "FloatBorder" },
			--     { "╮", "FloatBorder" },
			--     { "│", "FloatBorder" },
			--     { "╯", "FloatBorder" },
			--     { "─", "FloatBorder" },
			--     { "╰", "FloatBorder" },
			--     { "│", "FloatBorder" },
			-- },
			-- Maximal width of the hover window. Nil means no max.
			max_width = nil,
			-- Maximal height of the hover window. Nil means no max.
			max_height = nil,
			-- whether the hover action window gets automatically focused
			-- default: false
			auto_focus = true,
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

require("crates").setup({
	null_ls = {
		enabled = true,
		name = "crates.nvim",
	},
	popup = {
		border = "rounded",
		autofocus = true,
	},
})
