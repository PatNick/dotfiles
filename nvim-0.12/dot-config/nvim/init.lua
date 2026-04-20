vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = {
    backup = false,
    cmdheight = 1,
    colorcolumn = "80",
    errorbells = false,
    expandtab = true,
    guicursor = "",
    hlsearch = false,
    incsearch = true,
    laststatus = 3,
    mouse = "",
    nu = true,
    rnu = true,
    scrolloff = 8,
    shiftwidth = 4,
    signcolumn = "yes",
    softtabstop = 4,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    updatetime = 50,
    wrap = false
}

local globs = {
    mapleader = " ",
    netrw_browse_split = 0,
    netrw_banner = 1,
    netrw_winsize = 40,
    netrw_sort_by = "exten",
    netrw_liststyle = 1,
    loaded_python3_provider = 0,
    loaded_ruby_provider = 0,
    loaded_node_provider = 0,
    loaded_perl_provider = 0,
}

for k, v in pairs(opts) do
    vim.opt[k] = v
end

for k, v in pairs(globs) do
    vim.g[k] = v
end

vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
    end
})
vim.treesitter.language.add("go", { path = "/home/pat/.local/share/nvim/rocks/lib/luarocks/rocks-5.1/tree-sitter-go/0.0.44-1/parser/go.so" })
vim.treesitter.language.register("go", { "go", } )
