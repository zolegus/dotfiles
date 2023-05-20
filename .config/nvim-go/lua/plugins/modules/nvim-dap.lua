return {
    "mfussenegger/nvim-dap",
    lazy = false,
    enabled = true,
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local virtual_text = require("nvim-dap-virtual-text")
        local dap_go = require("dap-go")

        dap.adapters.lldb = {
            type = "executable",
            -- command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
            -- command = "/usr/local/cellar/llvm/16.0.4/bin/lldb-vscode", -- adjust as needed, must be absolute path
            command = "lldb-vscode",
            -- command = '/Users/zolegus/.vscode/extensions/vadimcn.vscode-lldb-1.9.0/lldb/bin/lldb', -- adjust as needed, must be absolute path
            -- command = "/Users/zolegus/.vscode/extensions/vadimcn.vscode-lldb-1.9.0/adapter/codelldb",
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

        dapui.setup()
        virtual_text.setup()
        dap_go.setup()
    end
}
