-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
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
    netrw_banner = 0,
    netrw_winsize = 25,
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

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- automatically check for plugin updates
  checker = { enabled = true },
})
