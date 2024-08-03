require("nvim-surround").setup({
	-- Configuration here, or leave empty to use defaults
	-- https://github.com/kylechui/nvim-surround
	surround = {
		-- [">"] = {
		-- 	add = { "< ", " >" },
		-- },
		-- ["<"] = {
		-- 	add = { "<", ">" },
		-- },

		-- 	["<"] = {
		-- 		add = { "< ", " >" },
		-- 		find = function()
		-- 			return M.get_selection({ motion = "a<" })
		-- 		end,
		-- 		delete = "^(. ?)().-( ?.)()$",
		-- 	},
		-- 	[">"] = {
		-- 		add = { "<", ">" },
		-- 		find = function()
		-- 			return M.get_selection({ motion = "a>" })
		-- 		end,
		-- 		delete = "^(.)().-(.)()$",
		-- 	},
	},
})

require("mini.pairs").setup({
	-- In which modes mappings from this `config` should be created
	modes = { insert = true, command = true, terminal = true },

	-- Global mappings. Each right hand side should be a pair information, a
	-- table with at least these fields (see more in |MiniPairs.map|):
	-- - <action> - one of 'open', 'close', 'closeopen'.
	-- - <pair> - two character string for pair to be used.
	-- By default pair is not inserted after `\`, quotes are not recognized by
	-- `<CR>`, `'` does not insert pair after a letter.
	-- Only parts of tables can be tweaked (others will use these defaults).
	mappings = {
		["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
		["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
		["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
		["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },

		[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
		["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
		["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
		[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
		['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
		["'"] = { action = "close", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
		["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
	},
})
