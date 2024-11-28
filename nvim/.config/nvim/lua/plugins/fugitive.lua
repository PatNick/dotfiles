return {
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", vim.cmd.G, desc = "GitStatus" },
            { "gf", "<cmd>diffget //2<CR>" },
            { "gj", "<cmd>diffget //3<CR>" },

        },
    },
}
