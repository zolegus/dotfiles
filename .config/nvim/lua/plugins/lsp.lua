----=====##### Language Server Protocols
-- Debug mode
vim.lsp.set_log_level("debug")

local icons = require("core.icons")
vim.diagnostic.config({
	-- virtual_text = { prefix = icons.ui.BoldDividerLeft },
	virtual_text = { prefix = icons.ui.TriangleShortArrowLeft },
	underline = true,
	update_in_insert = true, -- updated diagnostics until you leave insert mode
	severity_sort = true,
	-- signs = true, --{ active = signs },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
			[vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
			[vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
			[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
		},
	},
})

local lsp = require("lsp-zero")

local lsp_attach = function(client, bufnr)
	-- lsp.buffer_autoformat()
end

-- local AutoFormatSaveGrp = vim.api.nvim_create_augroup("AutoFormatSaveGrp", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	command = [[:LspZeroFormat]],
-- 	group = AutoFormatSaveGrp,
-- })

lsp.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({
		buffer = bufnr,
		exclude = { "F4", "go", "gi", "gr" },
	})
	vim.keymap.set("n", "gr", "<cmd>Glance references<cr>", { buffer = bufnr })
	vim.keymap.set("n", "gi", "<cmd>Glance implementations<cr>", { buffer = bufnr })
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = bufnr })
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr })
	-- autoformat on save
	if client.server_capabilities.documentFormattingProvider then
		vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })
      augroup END
    ]])
	end
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

require("crates").setup({
	-- src = {
	-- 	cmp = {
	-- 		enabled = true,
	-- 	},
	-- },
	-- null_ls = {
	-- 	enabled = true,
	-- 	name = "crates.nvim",
	-- },
	popup = {
		border = "rounded",
		autofocus = true,
	},
})

-- json/yaml/toml configs
require("lspconfig").jsonls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
-- toml
require("lspconfig").taplo.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		toml = {},
		keys = {
			{
				"K",
				function()
					print("works")
					if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
						require("crates").show_popup()
					else
						vim.lsp.buf.hover()
					end
				end,
				desc = "Show Crate Documentation",
			},
		},
	},
	-- servers = {
	-- 	taplo = {
	-- 		keys = {
	-- 			{
	-- 				"K",
	-- 				function()
	-- 					print("works")
	-- 					if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
	-- 						require("crates").show_popup()
	-- 					else
	-- 						vim.lsp.buf.hover()
	-- 					end
	-- 				end,
	-- 				desc = "Show Crate Documentation",
	-- 			},
	-- 		},
	-- 	},
	-- },
})

lsp.setup()

vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {},
	-- LSP configuration
	server = {
		-- capabilities
		capabilities = lsp.get_capabilities(),
		-- attach
		on_attach = function(client, bufnr)
			-- you can also put keymaps in here
		end,
		-- defaults
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				-- completion = {
				-- 	callSnippet = "Replace",
				-- },
				cargo = {
					allFeatures = true,
					loadOutDirsFromCheck = true,
					buildScripts = {
						enable = true,
					},
				},
				-- Add clippy lints for Rust.
				checkOnSave = {
					allFeatures = true,
					command = "clippy",
					extraArgs = { "--no-deps" },
				},
				procMacro = {
					enable = true,
					ignored = {
						["async-trait"] = { "async_trait" },
						["napi-derive"] = { "napi" },
						["async-recursion"] = { "async_recursion" },
						["leptos_macro"] = {
							-- optional: --
							-- "component",
							"server",
						},
					},
				},
				-- rustfmt = {
				-- 	overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
				-- },
			},
		},
	},
}

-- require("inlay-hints").setup({
-- 	only_current_line = false,
-- 	eol = {
-- 		right_align = false,
-- 	},
-- })

-----=====####### RUST ###############################
-- local ih = require("inlay-hints")
-- vim.api.nvim_set_hl(0, "RustInlayHints", { fg = "#313244" })
-- require("rust-tools").setup({
-- 	server = {
-- 		settings = {
-- 			["rust-analyzer"] = {
-- 				-- completion = {
-- 				-- 	callSnippet = "Replace",
-- 				-- },
-- 				check = {
-- 					command = "clippy",
-- 				},
-- 				runnables = {
-- 					-- cargoExtraArgs = { "--release" },
-- 				},
-- 				cargo = {
-- 					autoReload = true,
-- 					allFeatures = true,
-- 					loadOutDirsFromCheck = true,
-- 				},
-- 				lens = {
-- 					enable = true,
-- 				},
-- 				procMacro = {
-- 					enable = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- 	tools = {
-- 		executor = require("rust-tools/executors").termopen, -- can be quickfix, termopen, toggleterm
-- 		reload_workspace_from_cargo_toml = true,
-- 		runnables = {
-- 			use_telescope = true,
-- 		},
-- 		inlay_hints = {
-- 			auto = true,
-- 			only_current_line = false,
-- 			show_parameter_hints = false,
-- 			parameter_hints_prefix = "<-",
-- 			other_hints_prefix = "=>",
-- 			max_len_align = false,
-- 			max_len_align_padding = 1,
-- 			right_align = false,
-- 			right_align_padding = 7,
-- 			highlight = "InlayHints",
-- 			-- highlight = "RustInlayHints",
-- 		},
-- 		hover_actions = {
-- 			border = "rounded",
-- 			-- the border that is used for the hover window
-- 			-- see vim.api.nvim_open_win()
-- 			-- border = {
-- 			--     { "╭", "FloatBorder" },
-- 			--     { "─", "FloatBorder" },
-- 			--     { "╮", "FloatBorder" },
-- 			--     { "│", "FloatBorder" },
-- 			--     { "╯", "FloatBorder" },
-- 			--     { "─", "FloatBorder" },
-- 			--     { "╰", "FloatBorder" },
-- 			--     { "│", "FloatBorder" },
-- 			-- },
-- 			-- Maximal width of the hover window. Nil means no max.
-- 			max_width = nil,
-- 			-- Maximal height of the hover window. Nil means no max.
-- 			max_height = nil,
-- 			-- whether the hover action window gets automatically focused
-- 			-- default: false
-- 			auto_focus = true,
-- 		},
-- 		on_initialized = function()
-- 			ih.set_all()
--
-- 			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
-- 				pattern = { "*.rs" },
-- 				callback = function()
-- 					local _, _ = pcall(vim.lsp.codelens.refresh)
-- 				end,
-- 			})
-- 		end,
-- 	},
-- })
