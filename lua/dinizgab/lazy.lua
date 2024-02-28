local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local plugins = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
   {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-treesitter/nvim-treesitter-context"
    }
}

local opts = {
    install = {
        missing = true,
        colorscheme = { "gruvbox" }
    }
}

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
