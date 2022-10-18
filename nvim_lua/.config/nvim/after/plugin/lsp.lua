-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
--[[ capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities) ]]

local lspconfig = require('lspconfig')

local opts = { noremap=true, silent=true }
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

local servers = {
    'clangd',
    'pyright',
    'gopls',
    'bashls',
    'ansiblels',
    'tsserver',
    'html',
    'cssls',
}
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
    root_dir = function(fname)
        return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
    end
}

require("lspconfig").rust_analyzer.setup({
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    capabilities = capabilities,
    on_attach = my_attach,
})

-- luasnip setup
local luasnip = require('luasnip')

-- lspkind
local lspkind = require('lspkind')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y'] = cmp.mapping.confirm({ select = true }),
    }),
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

