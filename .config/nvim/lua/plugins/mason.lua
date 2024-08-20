local lsp_zero = require("lsp-zero")
require("mason").setup({})
require("mason-lspconfig").setup({
	-- ensure_installed = { "tsserver", "rust_analyzer" },
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		-- taplo lsp
		taplo = function()
			require("lspconfig").taplo.setup({
				servers = {
					taplo = {
						keys = {
							{
								"K",
								function()
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
				},
			})
		end,
		-- using rustaceanvim
		rust_analyzer = lsp_zero.noop,
	},
})
