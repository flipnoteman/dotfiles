return {
    -- NVTerm for better terminal plugin
    {
        "NvChad/nvterm",
        config = function()
            require("nvterm").setup()
        end,
	keys = {
	{'<leader>tv', mode = 'n', function() require('nvterm.terminal').new "vertical" end, desc = 'Spawn vertical term'},
	{'<leader>th', mode = 'n', function() require('nvterm.terminal').new "horizontal" end, desc = 'Spawn horizontal term'},
	{'<leader>ta', mode = 'n', function() require('nvterm.terminal').toggle_all_terms() end, desc = 'Toggle all terms'},
	{'<leader>ttf', mode = 'n', function() require('nvterm.terminal').toggle "float" end, desc = 'Toggle floating term'},
	{'<leader>ttv', mode = 'n', function() require('nvterm.terminal').toggle "vertical" end, desc = 'Toggle vertical term'},
	{'<leader>tth', mode = 'n', function() require('nvterm.terminal').toggle "horizontal" end, desc = 'Toggle horizontal term'},
	}
    }
}
