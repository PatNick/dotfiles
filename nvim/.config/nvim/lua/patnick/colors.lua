local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
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
})

-- Load the configuration set above and apply the colorscheme
vim.cmd("colorscheme nightfox")
