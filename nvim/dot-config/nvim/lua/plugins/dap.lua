return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        config = function (_, opts)
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
    {
        "leoluz/nvim-dap-go",
        dependencies =  {
            "mfussenegger/nvim-dap",
        },
        keys = {
            {"<leader>dt", "<CMD>lua require('dap-go').debug_test()<CR>"},
            {"<leader>b", "<CMD>lua require('dap').toggle_breakpoint()<CR>"},
            {"<leader>dc", "<CMD>lua require('dap').continue()<CR>"},
            {"<leader>dj", "<CMD>lua require('dap').step_over()<CR>"},
            {"<leader>dk", "<CMD>lua require('dap').step_into()<CR>"},
            {"<leader>do", "<CMD>lua require('dap').step_out()<CR>"},
        },
        config = function (_, opts)
            require("dap-go").setup()
        end,
    },
}
