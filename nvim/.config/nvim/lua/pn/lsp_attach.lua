local M = {}

local my_attach = function(client, buffer)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set('n', '<leader>vi', vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, {buffer=0})
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, {buffer=0})
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, {buffer=0})
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, {buffer=0})
    vim.keymap.set('n', '<leader>ff', function() vim.lsp.buf.format {aync=true} end, {buffer=0})
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {buffer=0})
end

M.my_attach = my_attach

return M
