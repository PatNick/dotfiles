return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
            },
        },
        keys = {
            { "<C-p>",      require("telescope.builtin").git_files,    desc = "Git Files", },
            { "<leader>pf", require("telescope.builtin").find_files,   desc = "Find Files", },
            { "<leader>ps", require("telescope.builtin").live_grep,    desc = "Live Grep", },
            { "<leader>vs", require("telescope.builtin").grep_string,  desc = "Search Under Cursor", },
            { "<leader>pb", require("telescope.builtin").buffers,      desc = "Search Buffers", },
            { "<leader>vh", require("telescope.builtin").help_tags,    desc = "Search Help", },
            { "<leader>gc", require("telescope.builtin").git_branches, desc = "Git Checkout", },
        },
        opts = function()
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

                    mappings = {
                        i = {
                            ["<C-x>"] = false,
                            ["<C-q>"] = actions.send_to_qflist,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        find_command = {
                            "rg",
                            "--files",
                            "--hidden",
                            "--glob",
                            "!**/.git/*"
                        },
                        no_ignore = true,
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            }

        end,
        config = function (_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("fzf")
        end,
    },
}
