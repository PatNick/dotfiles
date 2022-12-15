local opts = {
    nu = true,
    relativenumber = true,
    errorbells = false,
    mouse = "",
    splitbelow = true,
    splitright = true,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    wrap = false,
    incsearch = true,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    termguicolors = true,
    scrolloff = 8,
    signcolumn = "yes",
    cmdheight = 1,
    updatetime = 50,
    colorcolumn = "80"
}

for k, v in pairs(opts) do
    vim.opt[k] = v
end

local globs = {
    mapleader = " ",
    netrw_browse_split = 0,
    netrw_banner = 0,
    netrw_winsize = 25,
}

for k, v in pairs(globs) do
    vim.g[k] = v
end
