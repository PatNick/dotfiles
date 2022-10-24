local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        hidden = true,
        cwd = "~/dotfiles/nvim_lua/.config/nvim",
    })
end

return M
