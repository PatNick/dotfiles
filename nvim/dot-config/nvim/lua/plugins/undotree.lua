return {
    "mbbill/undotree",
    keys = {
        { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
    },
    init = function(_)
        vim.g.undotree_SetFocusWhenToggle = 1
    end,
}
