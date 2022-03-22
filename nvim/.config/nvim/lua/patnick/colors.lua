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
        hlgroups = {
            TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
            LspCodeLens = { bg = "#000000", style = "italic" },
            TelescopeBorder = { fg = "${fg_popup}", bg = "${bg_popup}" },
            TelescopePromptBorder = { fg = "${fg_visual}", bg = "${bg_visual}" },
            TelescopePromptNormal = { fg = "${fg_sidebar}", bg = "${bg_visual}" },
            TelescopePromptPrefix = { fg = "${fg_sidebar}", bg = "${bg_visual}" },
            TelescopeNormal = { fg = "${fg_sidebar}", bg = "${bg_popup}" },
            TelescopePreviewTitle = { fg = "${bg_popup}", bg = "${blue}" },
            TelescopePromptTitle = { fg = "${bg_popup}", bg = "${blue}" },
            TelescopeResultsTitle = { fg = "${bg_popup}", bg = "${blue}" },
            TelescopeMatching = { fg = "${error}", bg = "${NONE}" },
        },
    },
})

-- Load the configuration set above and apply the colorscheme
vim.cmd("colorscheme nightfox")
