-- Male sure to setup 'mapleader' and maplocalleader before
-- loading lazi.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- [[ Setting options ]]
-- See `:help vim.opt`

-- Make line numbers default
vim.opt.number = true
-- Relative line numbers, to help with jumping.
vim.opt.relativenumber = true

-- Disable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = ""

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes:1"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set the default border for all floating windows
vim.opt.winborder = "rounded"

--Use Spaces instad of taps
vim.opt.expandtab = true
-- size for spaces using << and >>
vim.opt.shiftwidth = 2
-- size for spaces for tab
vim.opt.tabstop = 2
-- how many spaces when prassing tab
vim.opt.softtabstop = 2

-- indetation opthions
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "│ ", space = " ", lead = " ", trail = "·", eol = "󰌑" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

vim.opt.termguicolors = true
vim.cmd([[syntax enable]])
vim.cmd([[filetype plugin indent on]])
