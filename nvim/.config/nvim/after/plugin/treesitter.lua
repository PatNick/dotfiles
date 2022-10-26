local status_ok, configs = pcall(require,"nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = {
        "c", "cpp",
        "go", "python", "java",
        "bash", "json", "lua",
        "vim", "rust", "html", "css",
    },
    sync_install = false,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = false,
    },
}