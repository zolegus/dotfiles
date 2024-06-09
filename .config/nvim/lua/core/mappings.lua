--################ GENERAL BINDINGS ######################
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "q", "<Nop>", opts)
map("v", "q", "<Nop>", opts)
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
-----=====##### Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
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
-- map("i", "kk", "<Esc>")
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
-----=====##### Comments
map("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end)
map("v", "<leader>/", '<Esc><Cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
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
