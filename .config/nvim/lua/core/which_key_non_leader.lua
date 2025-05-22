return {
	["<C-Q>"] = "Quit window",
	["<C-S>"] = "Save file",
	t = "Goto next symbol after cursor",
	T = "Goto new symbol before cursor",
	H = "Goto begin of line",
	L = "Goto end of line",
	K = "Hover",
	--== [LSP Actions](https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/api-reference.md#lsp-actions)
	-- (Exclude some mappings, see lsp-zero config)
	g = {
		name = "+Goto",
		a = "Code action",
		d = "Goto definition",
		D = "Goto declaration",
		i = "Goto implementation (glance)",
		r = "Goto references (glance)",
		l = "Goto float diagnostics",
		t = "Goto type",
		s = "Display signature info",
		w = {
			function()
				vim.wo.wrap = not vim.wo.wrap
			end,
			"Toggle wrap",
		},
	},
	["<F2>"] = "Rename all refs",
	["<F3>"] = "Format code",
	["<F4>"] = "Code Action",
}
