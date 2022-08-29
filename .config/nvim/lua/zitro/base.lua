local wo = vim.wo
local set = vim.opt

wo.number = true
wo.relativenumber = true

set.title = true
set.autoindent = true
set.smartindent = true
set.hlsearch = true
set.backup = false
set.showcmd = true
set.cmdheight = 1
set.laststatus = 2
set.expandtab = true
set.scrolloff = 10
set.inccommand = 'split'
set.ignorecase = true
set.smarttab = true
set.breakindent = true
set.shiftwidth = 2
set.tabstop = 2
set.wrap = false
set.backspace = { 'start', 'eol', 'indent' }

vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

vim.scriptencoding = 'utf-8'
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

set.formatoptions:append { 'r' }
