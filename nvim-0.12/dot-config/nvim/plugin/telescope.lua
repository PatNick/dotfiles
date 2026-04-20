vim.pack.add({
    "gh:nvim-lua/plenary.nvim",
    {
        src = "gh:nvim-telescope/telescope.nvim",
        version = "v0.2.2",
    },
})

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local telescopeConfig = require("telescope.config")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git Files" })
vim.keymap.set("n", "<leader>pf", builtin.find_files,   { desc = "Find Files" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep,    { desc = "Live Grep" })
vim.keymap.set("n", "<leader>vs", builtin.grep_string,  { desc = "Search Under Cursor" })
vim.keymap.set("n", "<leader>pb", builtin.buffers,      { desc = "Search Buffers" })
vim.keymap.set("n", "<leader>vh", builtin.help_tags,    { desc = "Search Help" })
vim.keymap.set("n", "<leader>gc", builtin.git_branches, { desc = "Git Checkout" })

require('telescope').setup{
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
        },
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
        }
    }
