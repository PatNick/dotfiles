local Remap = require("pn.keymap")
local nnoremap = Remap.nnoremap
local nmap = Remap.nmap

nnoremap("<leader>gs", ":G<CR>")
nmap("<leader>gj", ":diffget //3<CR>")
nmap("<leader>gf", ":diffget //2<CR>")
