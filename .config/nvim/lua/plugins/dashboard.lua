local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡄⡀⣀⠀⢀⣄⡤⠀  ",
	"⠀⠀⠀⠀⠀⢀⠤⢄⣀⢀⣚⣽⣿⣿⣾⠿⣿⣿⣿⡀⠀⠀  ▒███████▒    ▄████▄   ▒█████  ▓█████▄ ▓█████  ",
	"⠀⠀⠀⠀⠀⠃⣠⣤⣷⣿⣿⣿⣿⣿⣯⡿⣿⣟⣝⡙⠀⠀  ▒ ▒ ▒ ▄▀░   ▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀  ",
	"⠀⠄⣀⣤⣤⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⢻⣟⢟⢿⣿⠀   ░ ▒ ▄▀▒░    ▒▓█    ▄ ▒██░  ██▒░██   █▌▒███    ",
	"⠀⠀⠀⢈⡉⢛⣭⣾⣿⣿⢻⣿⣿⣿⡟⢿⣿⣿⣧⣿⡄     ▄▀▒   ░   ▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄  ",
	"⠀⣀⢪⢒⡹⠿⣻⡻⣿⣿⣧⡿⣿⣿⣧⠀⠙⢿⣿⣿⣷⡀  ▒███████▒   ▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒ ",
	"⠈⠘⢧⣶⣿⣿⣿⣯⡑⡻⢯⡻⢾⣿⣿⣦⡀⠀⢱⣿⣿⠇  ░▒▒ ▓░▒░▒   ░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░ ",
	"⠀⠀⠀⠀⡾⠻⣿⣿⣿⣷⣤⣮⣵⣾⣿⣿⡛⠂⢀⠉⠀   ░░▒ ▒ ░ ▒     ░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░ ",
	"⠀⠀⠀⢀⠀⣺⣷⣿⣿⣿⣿⣿⣿⣟⣿⣿⣯⣭⣁⡅⡀   ░ ░ ░ ░ ░   ░        ░ ░ ░ ▒   ░ ░  ░    ░    ",
	"⠀⠀⠀⣡⡾⣿⡿⠿⠿⠿⣿⣿⣿⣿⣯⣝⢿⣿⣽⣷⠀⠀    ░ ░       ░ ░          ░ ░     ░       ░  ░ ",
	"⠀⠀⠀⠘⠊⠎⠀⠀⠀⠀⠈⠫⠙⠃⠻⣿⡷⣫⡗⠁⠀⠀  ░           ░                  ░              ",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡰⠢⠀⠀⠀  ",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀  You always know what to do:",
}

dashboard.section.buttons.val = {
	dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
	dashboard.button("d", " " .. " Bookmarks", ":Telescope marks <CR>"),
	dashboard.button("b", " " .. " Git branches", ":Telescope git_branches <CR>"),
	dashboard.button("c", " " .. " Config", ":Neotree ~/.config/nvim/<CR>"),
	dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
	--         button("e", "- Explore", "<Plug>VinegarUp"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
	button.opts.hl = "AlphaButtons"
	button.opts.hl_shortcut = "AlphaShortcut"
end
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.opts.layout[1].val = 8

if vim.o.filetype == "lazy" then
	vim.cmd.close()
	vim.api.nvim_create_autocmd("User", {
		pattern = "AlphaReady",
		callback = function()
			require("lazy").show()
		end,
	})
end

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		local stats = require("lazy").stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins   in " .. ms .. "ms"
		pcall(vim.cmd.AlphaRedraw)
	end,
})

require("alpha").setup(dashboard.opts)
