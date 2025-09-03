return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
     {'<leader>ff', mode = 'n',function() require('fzf-lua').files() end, desc="Search files"},
     {'<leader>fg', mode = 'n',function() require('fzf-lua').global() end, desc="Search all"},
     {'<leader>fr', mode = 'n',function() require('fzf-lua').resume() end, desc="Resume"},
     {'<leader>fb', mode = 'n',function() require('fzf-lua').builtin() end, desc="Search Builtin"},
  },
}
