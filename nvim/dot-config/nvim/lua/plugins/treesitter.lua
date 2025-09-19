return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true },
            indent = { enable = false },
            ensure_installed = {
                "c",
                "bash",
                "cpp",
                "go",
                "java",
                "json",
                "lua",
                "python",
                "rust",
                "vim",
                "vimdoc",
            },
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
