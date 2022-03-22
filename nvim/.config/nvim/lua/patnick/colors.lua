local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
    options = {
        transparent = false,
        dim_inactive = true,
        styles = {
            comments = "italic", -- change style of comments to be italic
            keywords = "bold", -- change style of keywords to be bold
            functions = "italic,bold" -- styles can be a comma separated list
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
