local status_ok, configs = pcall(require,"nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = {
        "c", "cpp",
        "go", "python", "java",
        "bash", "json", "lua",
        "vim", "rust",
    },
    sync_install = false,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = false,
    },
}

require('nvim-treesitter.configs').setup{
    textobjects = {
        select = {
            enable = true,
            lookahead = true,keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = {
                    query = "@class.inner",
                    desc = "Select inner part of a class region"
                },
                ["as"] = {
                    query = "@scope",
                    query_group = "locals",
                    desc = "Select language scope"
                },
            },
            selection_modes = {
                ['@parameter.outer'] = 'v',
                ['@function.outer'] = 'V',
                ['@class.outer'] = '<c-v>',
            },
            include_surrounding_whitespace = true,
        },
    },
}
