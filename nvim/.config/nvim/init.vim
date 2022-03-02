"Plugins

call plug#begin('~/.vim/plugged')

Plug 'EdenEast/nightfox.nvim', { 'branch': 'main' }

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'

Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'preservim/nerdcommenter'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'


call plug#end()

syntax on

nnoremap <SPACE> <Nop>
let mapleader=' '

nnoremap Y y$

vnoremap < <gv
vnoremap > >gv
vnoremap . :norm.<CR>

nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz

nnoremap <leader>pv :Ex<CR>
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd _=<cr>
nnoremap <leader>x :silent !chmod +x %<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

nnoremap <expr> k (v:count > 5 ? "m'" . v:count :"") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count :"") . 'j'

"Misc
filetype plugin indent on

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup mygroup
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
