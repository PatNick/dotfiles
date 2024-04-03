return {
    {
        "rcarriga/nvim-dap-ui",
        main = "dapui",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        keys = {
            { "<F5>", "<cmd>lua require('dap').continue()<CR>" },
            { "<F2>", ":lua require('dap').step_into()<CR>" },
            { "<F3>", ":lua require('dap').step_over()<CR>" },
            { "<F4>", ":lua require('dap').step_out()<CR>" },
            { "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>" },
            { "<leader>B", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition '))<CR>" },
        },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.after.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.after.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "leoluz/nvim-dap-go",
        main = "dap-go",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            require("dap-go").setup()
        end,
    }
}
