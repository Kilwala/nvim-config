local cmd = vim.cmd
local g = vim.g

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.backup = false
vim.opt.showcmd = true

vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.tabstop = 4
vim.opt.ai = true
vim.opt.si = true

cmd "hi Normal guibg=NONE ctermbg=NONE"

vim.opt.clipboard = 'unnamedplus'
