--local colorscheme = 'monokai-pro'
--
--local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--if not is_ok then
  --vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  --return
--end

vim.opt.background = "dark" -- default to dark or light style

local opts = {...} -- options should be setted through a setup call:
require("monokai-nightasty").load(opts)


