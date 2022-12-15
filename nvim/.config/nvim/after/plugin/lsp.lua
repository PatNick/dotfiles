-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

local my_attach = require("pn.lsp_attach").my_attach

local servers = {
    "clangd",
    "pyright",
    "gopls",
    "bashls",
    "ansiblels",
    "tsserver",
    "html",
    "cssls",
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = my_attach,
        capabilities = capabilities,
    }
end

require("lspconfig").rust_analyzer.setup({
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    capabilities = capabilities,
    on_attach = my_attach,
})

require("lspconfig").sumneko_lua.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- luasnip setup
require("luasnip")

-- lspkind
local lspkind = require("lspkind")

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup {
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-y"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "cmp_tabnine" },
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                cmp_tabnine = "[T9]",
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

