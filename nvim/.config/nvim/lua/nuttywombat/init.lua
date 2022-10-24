require('nuttywombat.set')
require('nuttywombat.telescope')
require('nuttywombat.packer')

local augroup = vim.api.nvim_create_augroup
NuttyWombatGroup = augroup('NuttyWombat', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
