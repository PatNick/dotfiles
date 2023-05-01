-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "folke/tokyonight.nvim"

    use "ellisonleao/gruvbox.nvim"

    use "tpope/vim-fugitive"

    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope.nvim"

    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }

    use "nvim-lualine/lualine.nvim"
    use "kyazdani42/nvim-web-devicons"

    use "onsails/lspkind-nvim"
    use "mfussenegger/nvim-jdtls"

    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},

            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"},
            {"saadparwaiz1/cmp_luasnip"},
        }
    }


    use {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp"
    }

    use "mfussenegger/nvim-dap"
    use "leoluz/nvim-dap-go"
    use "rcarriga/nvim-dap-ui"
    use "mfussenegger/nvim-dap-python"

    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    use "preservim/nerdcommenter"

    use "mbbill/undotree"

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "nvim-treesitter/nvim-treesitter-context"

    use "nvim-treesitter/playground"

    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"},
        }
    }

end)
