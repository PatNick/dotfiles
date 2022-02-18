"Telescope
lua require("patnick")

nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>pf <cmd>Telescope find_files<cr>
nnoremap <leader>ps <cmd>Telescope live_grep<cr>
" nnoremap <leader>pb <cmd>Telescope buffers<cr>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>gc <cmd>Telescope git_branches<cr>
nnoremap <leader>vrc :lua require('patnick.telescope').search_dotfiles()<CR>
