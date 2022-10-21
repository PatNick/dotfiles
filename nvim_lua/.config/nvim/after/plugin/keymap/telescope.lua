local Remap = require('nuttywombat.keymap')
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)

nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({search = vim.fn.input("Grep for > ")})
end)

nnoremap("<leader>pf", function()
    require('telescope.builtin').find_files({hidden = true})
end)

nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader>gc", function()
    require('telescope.builtin').git_branches()
end)

nnoremap("<leader>vrc", function()
    require('nuttywombat.telescope').search_dotfiles()
end)
