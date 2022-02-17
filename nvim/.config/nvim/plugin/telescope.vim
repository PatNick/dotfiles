"Telescope

nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>pf <cmd>Telescope find_files<cr>
nnoremap <leader>ps <cmd>Telescope live_grep<cr>
nnoremap <leader>pb <cmd>Telescope buffers<cr>
nnoremap <leader>gc <cmd>Telescope git_branches<cr>

lua << EOF
require('telescope').setup{

defaults = {
    file_sorter = require("telescope.sorters").get_fzf_sorter,

    file_previewer = require("telescope.previewers").vim_buffer_cat_new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    mappings = {
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

EOF
