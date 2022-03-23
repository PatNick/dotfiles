-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local opts = { noremap=true, silent=true }
local my_attach = function()
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd> lua vim.lsp.buf.hover()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vd', '<cmd> lua vim.lsp.buf.definition()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vi', '<cmd> lua vim.lsp.buf.implementation()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vsh', '<cmd> lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vrr', '<cmd> lua vim.lsp.buf.references()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vrn', '<cmd> lua vim.lsp.buf.rename()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vca', '<cmd> lua vim.lsp.buf.code_action()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd> lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd> lua vim.diagnostic.goto_next()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vsd', '<cmd> Telescope diagnostics<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ff', '<cmd> lua vim.lsp.buf.formatting()<cr>', opts)
end

local servers = { 'clangd', 'pyright', 'gopls', 'vimls', 'bashls', 'ansiblels' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = my_attach,
        capabilities = capabilities,
    }
end

require('lspconfig')['jdtls'].setup {
    cmd = { 'jdtls' },
    capabilities = capabilities,
    on_attach = my_attach,
}

-- luasnip setup
local luasnip = require('luasnip')

-- lspkind
local lspkind = require('lspkind')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                path = "[path]",
                luasnip = "[snip]",
                nvim_lua = "[API]",
            }
        },
    },
    experimental = {
        ghost_text = true,
    }
}
