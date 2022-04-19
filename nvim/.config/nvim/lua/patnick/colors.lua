local nightfox = require('nightfox')

local palette = require('nightfox.palette').load('nightfox')

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
        LineNr = { fg = "palette.orange" },
        LineNrAbove = { fg = "grey" },
        LineNrBelow = { fg = "grey" },
        TSPunctDelimiter = { fg = "palette.red" },
    },
})

vim.cmd("colorscheme nightfox")
