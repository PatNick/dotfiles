local M = {}

local statusline = {
    '%t ',
    '%h %m %r',
    '%Y%=%{v:register}',
    '%-14.(%l,%c%V%)',
    '%P',
}

M.opts = {
    nu = true,
    rnu = true,
    errorbells = false,
    mouse = "",
    splitbelow = true,
    splitright = true,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    wrap = false,
    hlsearch = false,
    incsearch = true,
    backup = false,
    swapfile = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    termguicolors = true,
    scrolloff = 8,
    signcolumn = "yes",
    cmdheight = 1,
    updatetime = 50,
    laststatus = 3,
    statusline = table.concat(statusline, ''),
    colorcolumn = "80"
}

M.globs = {
    mapleader = " ",
    netrw_browse_split = 0,
    netrw_banner = 0,
    netrw_winsize = 25,
    loaded_python3_provider = 0,
    loaded_ruby_provider = 0,
    loaded_node_provider = 0,
    loaded_perl_provider = 0,
}

return M
