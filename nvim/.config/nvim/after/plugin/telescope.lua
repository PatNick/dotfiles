local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")

require('telescope').setup{

    defaults = {
        file_sorter = sorters.get_fzf_sorter,
        prompt_prefix = " >",
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
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    },
}

require('telescope').load_extension('fzf')

