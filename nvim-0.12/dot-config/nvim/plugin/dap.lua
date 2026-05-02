vim.pack.add({
    "gh:rcarriga/nvim-dap-ui",
    "gh:mfussenegger/nvim-dap",
    "gh:nvim-neotest/nvim-nio",
    "gh:leoluz/nvim-dap-go",
})

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

require("dap-go").setup()

vim.keymap.set("n", "<leader>dt", "<CMD>lua require('dap-go').debug_test()<CR>")
vim.keymap.set("n", "<leader>b", "<CMD>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dc", "<CMD>lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>dj", "<CMD>lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<leader>dk", "<CMD>lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>do", "<CMD>lua require('dap').step_out()<CR>")
