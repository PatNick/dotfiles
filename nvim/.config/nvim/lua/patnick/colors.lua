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
        all = {
            LineNr = { fg = "palette.orange" },
            LineNrAbove = { fg = "palette.bg4" },
            LineNrBelow = { fg = "palette.bg4" },
            TSPunctDelimiter = { fg = "palette.red" },
        }
    },
})

vim.cmd("colorscheme nightfox")
