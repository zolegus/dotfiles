local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
null_ls.setup({
	sources = {
		--== lua
		null_ls.builtins.formatting.stylua,
		--== python
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.formatting.black,
		--== rust
		-- null_ls.builtins.formatting.rustfmt, --because rust-analyzer do
		--== go
		-- null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.gofumpt, -- mvdan.cc/gofumpt@latest
		-- null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.goimports_reviser, -- github.com/incu6us/goimports-reviser/v3@latest
		-- null_ls.builtins.formatting.golines, -- github.com/segmentio/golines@latest
		--== toml
		null_ls.builtins.formatting.taplo,
		--== sql
		null_ls.builtins.formatting.sql_formatter,
		--== others
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
			},
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						-- filter = function(client)
						-- 	return client.name == "null-ls"
						-- end,
					})
				end,
			})
		end
	end,
})
