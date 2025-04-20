local ensure_installed = {
    "lua_ls",
    "gopls",
}
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "mfussenegger/nvim-jdtls",
        },
        config = function()
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = "LSP Actions",
                callback = function(ev)
                    local bufnr = ev.buf
                    local map = function(m, lhs, rhs)
                        local opts = { buffer = bufnr }
                        vim.keymap.set(m, lhs, rhs, opts)
                    end
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    map("n", "K",           vim.lsp.buf.hover)
                    map("n", "gd",          vim.lsp.buf.definition)
                    map("n", "<leader>vi",  vim.lsp.buf.implementation)
                    map("i", "<C-h>",       vim.lsp.buf.signature_help)
                    map("n", "<leader>vrr", vim.lsp.buf.references)
                    map("n", "<leader>vd",  vim.diagnostic.open_float)
                    map("n", "<leader>vrn", vim.lsp.buf.rename)
                    map("n", "<leader>vca", vim.lsp.buf.code_action)
                    map("n", "[d",          vim.diagnostic.goto_prev)
                    map("n", "]d",          vim.diagnostic.goto_next)
                end,
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = { ensure_installed = ensure_installed, },
        config = function()
            require("mason-lspconfig").setup()

            require("mason-lspconfig").setup_handlers {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `rust_analyzer`:
                --["rust_analyzer"] = function ()
                    --require("rust-tools").setup {}
                --end
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" }, },
                                workspace = { preloadFileSize = 1000 },
                            }
                        }
                    }
                end,
            }
            vim.lsp.set_log_level("ERROR")
        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        keys = {
            { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
        },
        opts = {
            ensure_installed = ensure_installed,
        },
    },
}
