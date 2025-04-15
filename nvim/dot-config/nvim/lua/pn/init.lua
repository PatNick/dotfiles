local sets = require("pn.set")

for k, v in pairs(sets.opts) do
    vim.opt[k] = v
end

for k, v in pairs(sets.globs) do
    vim.g[k] = v
end

local augroup = vim.api.nvim_create_augroup
NuttyWombatGroup = augroup("NuttyWombat", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd("BufWritePre", {
    group = NuttyWombatGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
