local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require('tokyonight').setup {
                styles = {
                    comments = { italic = false }, -- Disable italics in comments
                },
            }
            vim.cmd.colorscheme 'tokyonight-night'
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        opts = {
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    {
        -- Main LSP Configuration
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Mason must be loaded before its dependents so we need to set it up here.
            -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
            { 'williamboman/mason.nvim', opts = {} },
            'williamboman/mason-lspconfig.nvim',
            -- Useful status updates for LSP.
            { 'j-hui/fidget.nvim',       opts = {} },
            -- Allows extra cmp capabilities
            'saghen/blink.cmp',
        },
        config = function()
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                                disable = { "missing-fields" },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            }
                        },
                    },
                },
            }

            require('mason-lspconfig').setup {
                automatic_installation = false,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = require('blink.cmp').get_lsp_capabilities()

                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            }
        end,
    },
    {
        'saghen/blink.cmp',
        opts = {
            keymap = { preset = 'default' },
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
    },
    {
        'tpope/vim-sleuth',
    },
})
