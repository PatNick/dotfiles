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
                    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
                    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
                    map("n", "<leader>vi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
                    map("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
                    map("n", "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<cr>")
                    map("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>")
                    map("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<cr>")
                    map("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
                    map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
                    map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
                end,
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = ensure_installed,
        },
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
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {
                                    preloadFileSize = 1000
                                },
                            }
                        }
                    }
                end,
            }
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
