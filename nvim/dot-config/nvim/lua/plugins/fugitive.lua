return {
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", "<CMD>G<CR>", desc = "GitStatus" },
            { "<leader>gl", "<CMD>G log<CR>", desc = "Show git Log" },
            { "<leader>gb", "<CMD>G blame<CR>", desc = "Blame current file/line" },
            { "gf", "<cmd>diffget //2<CR>" },
            { "gj", "<cmd>diffget //3<CR>" },
        },
    },
}
