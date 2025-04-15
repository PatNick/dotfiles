return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                lazy = true
            },
        },
        keys = {
            {
                "<C-p>",
                "<cmd>Telescope git_files<cr>",
                desc = "Git Files",
            },
            {
                "<leader>pf",
                "<cmd>Telescope find_files<cr>",
                desc = "Find Files",
            },
            {
                "<leader>ps",
                "<cmd>Telescope live_grep<cr>",
                desc = "Live Grep",
            },
            {
                "<leader>vs",
                "<cmd>Telescope grep_string<cr>",
                desc = "Search Under Cursor",
            },
            {
                "<leader>pb",
                "<cmd>Telescope buffers<cr>",
                desc = "Search Buffers",
            },
            {
                "<leader>vh",
                "<cmd>Telescope help_tags<cr>",
                desc = "Search Help",
            },
            {
                "<leader>gc",
                "<cmd>Telescope git_branches<cr>",
                desc = "Git Checkout",
            },
        },
        opts = function()
            local previewers = require("telescope.previewers")
            --local sorters = require("telescope.sorters")
            local actions = require("telescope.actions")
            local telescopeConfig = require("telescope.config")
            local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

            table.insert(vimgrep_arguments, "--hidden")
            table.insert(vimgrep_arguments, "--glob")
            table.insert(vimgrep_arguments, "!**/.git/*")

            return {
                defaults = {
                    vimgrep_arguments = vimgrep_arguments,

                    prompt_prefix = "> ",
                    color_devicons = true,

                    file_previewer = previewers.vim_buffer_cat.new,
                    grep_previewer = previewers.vim_buffer_vimgrep.new,
                    qflist_previewer = previewers.vim_buffer_qflist.new,

                    mappings = {
                        i = {
                            ["<C-x>"] = false,
                            ["<C-q>"] = actions.send_to_qflist,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                        no_ignore = true,
                    }
                },
            }

        end,
    },
}
