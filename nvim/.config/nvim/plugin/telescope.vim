"Telescope
lua require("patnick")

nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>pf <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search=vim.fn.input("Grep For > ") })<CR>

nnoremap <leader>pb <cmd>Telescope buffers<cr>
nnoremap <leader>gc <cmd>Telescope git_branches<cr>
nnoremap <leader>vrc <cmd>lua require('patnick.telescope').search_dotfiles()<CR>
