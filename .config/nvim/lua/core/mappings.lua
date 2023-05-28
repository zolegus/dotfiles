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
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
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

vim.keymap.set("n", "<leader><leader>", ":Telescope buffers<CR>")
-- vim.keymap.set("n", "*", ":Telescope grep_string<CR>")

-----=====##### Telescope
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>st", builtin.live_grep, {})
-- vim.keymap.set("n", "<leader> ", builtin.buffers, {})
-- vim.keymap.set('n', '<Tab>', builtin.buffers, {})
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
-- vim.keymap.set("n", "*", builtin.grep_string, {})
-- vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
-- vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
-- vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
-- vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {})
-- vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true, silent = true })
-- vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<cr>")

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

