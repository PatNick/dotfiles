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
    },
    groups = {
        LineNr = { fg = "pallet.white" },
        LineNrAbove = { fg = "pallet.black" },
        LineNrBelow = { fg = "pallet.black" },
        TSPunctDelimiter = { fg = "pallet.red" },
    },
})

vim.cmd("colorscheme nightfox")
