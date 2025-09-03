return {
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
}
