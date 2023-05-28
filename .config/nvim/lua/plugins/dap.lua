local dap = require("dap")
local dapui = require("dapui")
local virtual_text = require("nvim-dap-virtual-text")
local neodev = require("neodev")

-- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.9.0/'
-- local codelldb_path = extension_path .. 'adapter/codelldb'
-- local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'  -- MacOS: This may be .dylib
-- dap.adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)


dap.adapters.lldb = {
    type = "executable",
    command = "lldb-vscode",
    name = "lldb"
}
local lldb = {
    name = "Launch lldb",
    type = "lldb", -- matches the adapter
    request = "launch", -- could also attach to a currently running process
    program = function()
        return vim.fn.input(
            "Path to executable: ",
            vim.fn.getcwd() .. "/",
            "file"
        )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
}

dap.configurations.rust = {
    lldb
}
--TODO: Refactoring
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "▷", texthl = "DapStopped" })
dapui.setup()

virtual_text.setup()

neodev.setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- use nvim-dap events to open and close the windows automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
-- debug
-- local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.9.0/'
-- local codelldb_path = extension_path .. 'adapter/codelldb'
-- local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'  -- MacOS: This may be .dylib
--
-- local opts = {
--   server = {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   },
--   dap = {
--     adapter = require('rust-tools.dap').get_codelldb_adapter(
--       codelldb_path, liblldb_path)
--   }
-- }
--
-- return opts
