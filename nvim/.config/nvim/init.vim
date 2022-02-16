"Plugins

call plug#begin('~/.vim/plugged')

Plug 'whatyouhide/vim-gotham'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'preservim/nerdcommenter'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

syntax on
colorscheme gotham256

nnoremap <SPACE> <Nop>
let mapleader=' '

nnoremap j gj
nnoremap k gk

nnoremap gj j
nnoremap gk k

nnoremap Y y$

vnoremap < <gv
vnoremap > >gv
vnoremap . :norm.<CR>

nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz

nnoremap <leader>gs :G<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd _=<cr>
nnoremap <leader>x :silent !chmod +x %<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap J mzJ`z

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
