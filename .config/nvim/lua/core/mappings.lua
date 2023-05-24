--################ GENERAL BINDINGS ######################
vim.g.mapleader = " "
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-q>", ":q<CR>")
-- Copy all
-- ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },

-----=====##### Movement
vim.keymap.set("n", "<C-h>", "<cmd> NavigatorLeft <CR>")
vim.keymap.set("n", "<C-j>", "<cmd> NavigatorDown <CR>")
vim.keymap.set("n", "<C-k>", "<cmd> NavigatorUp <CR>")
vim.keymap.set("n", "<C-l>", "<cmd> NavigatorRight <CR>")
-----=====##### Improved Terminal Navigation
vim.keymap.set("t", "<C-h>", "<cmd> NavigatorLeft <CR>")
vim.keymap.set("t", "<C-j>", "<cmd> NavigatorDown <CR>")
vim.keymap.set("t", "<C-k>", "<cmd> NavigatorUp <CR>")
vim.keymap.set("t", "<C-l>", "<cmd> NavigatorRight <CR>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-a>", "<ESC>^i")
vim.keymap.set("i", "<C-e>", "<End>")

------=====##### Control
vim.keymap.set("n", "<Esc>", ":noh <CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
--vim.keymap.set('n', '<leader>wh', ':split<CR>')
--vim.keymap.set('n', '<leader>wq', ':q<CR>')

-----=====##### Comments
vim.keymap.set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end)
vim.keymap.set("v", "<leader>/", '<Esc><Cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-----=====##### NeoTree
vim.keymap.set("n", "<leader>e", ":Neotree float focus<CR>")
vim.keymap.set("n", "<leader>o", ":Neotree float git_status<CR>")

-----=====##### Tabs
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")

-----=====##### Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
vim.keymap.set("n", "<leader>st", builtin.live_grep, {})
vim.keymap.set("n", "<leader> ", builtin.buffers, {})
-- vim.keymap.set('n', '<Tab>', builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "*", builtin.grep_string, {})
vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<cr>")

-----=====##### Search&Replace nvim-spectre
-- vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
--     desc = "Open Spectre"
-- })
-- vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
--     desc = "Search current word"
-- })
-- vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
--     desc = "Search current word"
-- })
-- vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
--     desc = "Search on current file"
-- })


-----=====##### LSP Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
		-- vim.keymap
		--     .set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
		--                opts)
		-- vim.keymap.set('n', '<Leader>sl', function()
		--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		-- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
		-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<Leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
