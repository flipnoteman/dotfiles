local keymaps = {}

-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

vim.g.mapleader = ' '
-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<Tab>', ':tabnext<CR>', opts) 

-- Customized on_attach functions for diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic toggle floating window' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagnostic goto previous' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Diagnostic goto next' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic set location list' })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Flash
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash treesitter' })
vim.keymap.set('o', 'r', function() require('flash').remote() end, { desc = 'Remote flash' })
vim.keymap.set({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter search' })
vim.keymap.set('c', '<C-s>', function() require('flash').toggle() end, { desc = 'Toggle flash search' })

-- NvTerm
vim.keymap.set('n', '<leader>tv', function() require('nvterm.terminal').new "vertical" end, { desc = 'Spawn new vertical term' } )
vim.keymap.set('n', '<leader>th', function() require('nvterm.terminal').new "horizontal" end, { desc = 'Spawn new horizontal term' } )
vim.keymap.set('n', '<leader>ta', function() require('nvterm.terminal').toggle_all_terms() end, { desc = 'Toggle all terms' } )
vim.keymap.set('n', '<leader>ttf', function() require('nvterm.terminal').toggle "float" end, { desc = 'Toggle floating term' } )
vim.keymap.set('n', '<leader>ttv' , function() require('nvterm.terminal').toggle 'vertical' end, { desc = 'Toggle vertical term' } )
vim.keymap.set('n', '<leader>tth' , function() require('nvterm.terminal').toggle 'horizontal' end, { desc = 'Toggle horizontal term' } )

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('v', '/', ':norm i// <CR>', opts)
vim.keymap.set('v', '?', ':norm 3x<CR>', opts)

-----------
-- Other --
-----------

-- List of keymaps to be attached when lsp server is running
keymaps.lsp_on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { unpack(bufopts), desc = 'Goto Declaration' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { unpack(bufopts), desc = 'Goto Definition' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { unpack(bufopts), desc = 'Hover LSP Info' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { unpack(bufopts), desc = 'Goto Implementation' })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { unpack(bufopts), desc = 'Hover signature help' })
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
        { unpack(bufopts), desc = 'Add workspace folder' })
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
        { unpack(bufopts), desc = 'Remove workspace folder' })
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { unpack(bufopts), desc = 'List workspace folders' })
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { unpack(bufopts), desc = 'Type Definition' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { unpack(bufopts), desc = 'Rename' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { unpack(bufopts), desc = 'Code Actions' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { unpack(bufopts), desc = 'Goto References' })
    vim.keymap.set("n", "<leader>fm", function()
        vim.lsp.buf.format({ async = true })
    end, { unpack(bufopts), desc = 'LSP Format' })
end

return keymaps
