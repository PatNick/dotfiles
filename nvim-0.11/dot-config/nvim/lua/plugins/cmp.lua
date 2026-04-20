return {
    "hrsh7th/nvim-cmp",
    dependencies =  {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "petertriho/cmp-git",
        "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
        local cmp = require("cmp")
        local snip = require("luasnip")
        return {
            snippet = {
                expand = function(args)
                    snip.lsp_expand(args.body)
                end,
            },
            window = {
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-u>"] = cmp.mapping.scroll_docs(4),
                ["<C-y>"] = cmp.mapping.confirm({
                    behavior = cmp.SelectBehavior.Insert,
                    select = true,
                }),
                ["<Tab>"] = nil,
                ["<S-Tab>"] = nil,
                ["<CR>"] = nil,
            }),
            sources = cmp.config.sources({
                {name = "nvim_lsp"},
                {name = "luasnip"},
                {name = "buffer"},
                {name = "path"},
                {name = "git"},
            }),
        }
    end,
    config = function (_, opts)
        require("cmp").setup(opts)
        require("cmp_git").setup()
    end,
}
