return {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
    dependencies = {
        { "leoluz/nvim-dap-go", opts = {} },
        {
            "rcarriga/nvim-dap-ui",
            dependencies = { "nvim-neotest/nvim-nio", },
            keys = { { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" }, },
            opts = {},
            config = function(_, opts)
                local dap = require("dap")
                local dapui = require("dapui")
                dapui.setup(opts)
                dap.listeners.after.event_initialized["dapui_config"]  = function() dapui.open({}) end
                dap.listeners.before.event_initialized["dapui_config"] = function() dapui.close({}) end
                dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close({}) end
            end,
        },
    },
    keys = {
        { "<leader>d", "", "+debug", mode = {"n", "v"} },
        { "<leader>b",  function() require("dap").toggle_breakpoint() end, desc = "Breakpoint Condition" },
        { "<leader>dc", function() require("dap").continue() end,          desc = "Run/Continue" },
        { "<leader>dn", function() require("dap").next() end,              desc = "Next Line" },
        { "<leader>di", function() require("dap").step_into() end,         desc = "Step Into" },
        { "<leader>do", function() require("dap").step_over() end,         desc = "Step Over" },
        { "<leader>dO", function() require("dap").step_out() end,          desc = "Step Out" },
        { "<leader>de", function()
            local dap = require("dap")
            local ui = require("dapui")
            ui.close({})
            dap.terminate()
        end},
        { "<leader>dE", function()
            local dap = require("dap")
            dap.clear_breakpoints()
            require("dapui").close({})
            dap.terminate()
        end},
    },
}
