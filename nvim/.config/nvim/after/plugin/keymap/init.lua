local Remap = require("nuttywombat.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nnoremap("Y", "yg$")

nnoremap("<C-j>", "<cmd>cnext<cr>zz")
nnoremap("<C-k>", "<cmd>cprev<cr>zz")

nnoremap("<leader>pv", "<cmd>Ex<cr>")
nnoremap("<leader>x", "<cmd>!chmod +x %<cr", { silent = true })

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("J", "mzJ`z")

nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

nnoremap("<leader>ee", "oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>")
