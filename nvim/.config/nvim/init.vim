"Plugins

call plug#begin('~/.vim/plugged')

Plug 'EdenEast/nightfox.nvim', { 'branch': 'main' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'gruvbox-community/gruvbox'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'

Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

Plug 'mattn/emmet-vim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'preservim/nerdcommenter'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'editorconfig/editorconfig-vim'

Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'

call plug#end()

syntax on

nnoremap <SPACE> <Nop>
let mapleader=' '

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>

nnoremap Y y$

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

vnoremap < <gv
vnoremap > >gv
vnoremap . :norm.<CR>

nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz

nnoremap <leader>pv :Ex<CR>
nnoremap <leader>x :silent !chmod +x %<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

nnoremap <expr> k (v:count > 5 ? "m'" . v:count :"") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count :"") . 'j'

nnoremap <leader>ee oif err != nil {<CR>return nil, err<CR>}<CR><esc>kkI<esc>


"Misc
filetype plugin indent on

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup mygroup
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
