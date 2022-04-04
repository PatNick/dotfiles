local nightfox = require('nightfox')

nightfox.setup({
    options = {
        transparent = false,
        dim_inactive = true,
        styles = {
            comments = "italic",
            keywords = "bold",
            functions = "italic,bold"
        },
        inverse = {
            match_paren = false,
            visual = true,
            search = true,
        },
        modules = {
            telescope = true,
            cmp = true,
        },
    },
    groups = {
        LineNr = { fg = "white" },
        LineNrAbove = { fg = "grey" },
        LineNrBelow = { fg = "grey" },
        TSPunctDelimiter = { fg = "pallet.red" },
    },
})

vim.cmd("colorscheme nightfox")
