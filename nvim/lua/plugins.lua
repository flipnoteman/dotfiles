local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
    -- LSP manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Vscode-like pictograms
	{
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
	},

    -- Auto-completion engine
	{
    "hrsh7th/nvim-cmp",
    dependencies = {
        "lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
        "hrsh7th/cmp-buffer", -- buffer auto-completion
        "hrsh7th/cmp-path", -- path auto-completion
        "hrsh7th/cmp-cmdline", -- cmdline auto-completion
    },
    config = function()
        require("config.nvim-cmp")
    end,
	},

	-- Code snippet engine
	{
    "L3MON4D3/LuaSnip",
    version = "v2.*",
	},

    -- Monokai theme
    "tanvirtin/monokai.nvim",

    -- Nvim syntax parsing, useful for syntax highligting and lsp stuff
    {
    "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              ensure_installed = { "rust", "xml", "c", "cpp", "lua", "vim" },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },
            })
        end
     },

    -- Lateral file/buffer movement/search
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Using other means of activing the Esc key, mine is 'jk'
    {
      "max397574/better-escape.nvim",
        config = function()
        require("better_escape").setup()
      end,
    },

    -- For easy multi cursor setup
    "mg979/vim-visual-multi",

    -- Language server setup
    "neovim/nvim-lspconfig",

    -- Gives a hint window for keybinds
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps",
        },
      },
    },

    -- For quickly moving inside a buffer
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {}
    },

    -- NVTerm for better terminal plugin
    {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup()
        end,

    }
})
