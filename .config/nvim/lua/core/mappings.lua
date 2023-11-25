--################ GENERAL BINDINGS ######################
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-q>", ":q<CR>", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
-- ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
-- ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
-- ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "H", "^", opts) -- to begin of line
map("n", "L", "$", opts) -- end of line

-- better indenting
map("v", "J", ":m '>+1<CR>gv=gv", opts) -- moving selected text
map("v", "K", ":m '<-2<CR>gv=gv", opts) -- moving selected text
map("v", "H", "^", opts) -- to begin of line
map("v", "L", "$", opts) -- end of line
map("v", "<", "<gv") -- better indenting
map("v", ">", ">gv") -- better indenting
-- paste over currently selected text without yanking it
-- map("v", "p", '"_dp')
-- map("v", "P", '"_dP')
-----=====##### Movement between windows/panes
map("n", "<C-h>", "<cmd> NavigatorLeft <CR>")
map("n", "<C-j>", "<cmd> NavigatorDown <CR>")
map("n", "<C-k>", "<cmd> NavigatorUp <CR>")
map("n", "<C-l>", "<cmd> NavigatorRight <CR>")
-----=====##### Improved Terminal Navigation
map("t", "<C-h>", "<cmd> NavigatorLeft <CR>")
map("t", "<C-j>", "<cmd> NavigatorDown <CR>")
map("t", "<C-k>", "<cmd> NavigatorUp <CR>")
map("t", "<C-l>", "<cmd> NavigatorRight <CR>")
map("i", "<C-k>", "<Up>")
map("i", "<C-j>", "<Down>")
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-a>", "<ESC>^i")
map("i", "<C-e>", "<End>")
------=====##### Control
map("n", "<Esc>", ":noh <CR>")
map("i", "jj", "<Esc>")
map("n", "<leader>v", ":vsplit<CR>")
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
-----=====##### Comments
map("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end)
map("v", "<leader>/", '<Esc><Cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
-----=====##### NeoTree
map("n", "<leader>e", ":Neotree float focus<CR>")
map("n", "<leader>o", ":Neotree float git_status<CR>")
-----=====##### Tabs
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<leader><leader>", ":Telescope buffers<CR>")
-- map("n", "*", ":Telescope grep_string<CR>")
-----=====##### Debug
-- map("n", '<F2>', "<Cmd>DapToggleBreakpoint<CR>", opts)
map("n", "<F5>", "<Cmd>RustRunnable<CR>", opts)
map("n", "<F6>", "<Cmd>lua require'dap'.run_last()<CR>", opts)
map("n", "<F7>", "<Cmd>DapStepOver<CR>", opts)
map("n", "<F8>", "<Cmd>DapStepInto<CR>", opts)
map("n", "<F9>", "<Cmd>DapStepOut<CR>", opts)
map("n", "<F11>", "<Cmd>DapTerminate<CR>", opts)
-- map("n", '<F1>', "<Cmd>DapContinue<CR>", opts)
-- map("n", '<F3>', "<Cmd>DapRestartFrame<CR>", opts)
-----=====##### Tools
map("n", "<C-g>", "<cmd> LazyGit <CR>")
-----=====##### Telescope
-- local builtin = require("telescope.builtin")
-- map("n", "<leader>sf", builtin.find_files, {})
-- map("n", "<leader>st", builtin.live_grep, {})
-- map("n", "<leader> ", builtin.buffers, {})
-- map('n', '<Tab>', builtin.buffers, {})
-- map("n", "<leader>fh", builtin.help_tags, {})
-- map("n", "*", builtin.grep_string, {})
-- map("n", "<leader>gb", builtin.git_branches, {})
-- map("n", "<leader>gc", builtin.git_commits, {})
-- map("n", "<leader>gs", builtin.git_status, {})
-- map("n", "<leader>ls", builtin.lsp_document_symbols, {})
-- map("n", "gr", builtin.lsp_references, { noremap = true, silent = true })
-- map("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true })
-- map("n", "<leader>su", "<cmd>Telescope undo<cr>")
