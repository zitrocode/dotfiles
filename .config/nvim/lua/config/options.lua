vim.g.mapleader = " "

-- [[ Setting options ]]
-- See `:help vim.opt`

-- [[ Lines numbers ]]
vim.opt.number = true -- Make line numbers default
vim.opt.relativenumber = true -- Relative line numbers, to help with jumping.

-- [[ Mouse ]]
vim.opt.mouse = "" -- Disable mouse mode, can be useful for resizing splits for example!

-- [[ UI behavior ]]
vim.opt.showmode = true -- Don't show the mode, since it's already in the status line
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.signcolumn = "yes:1" -- Keep signcolumn on by default
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor

-- [[ Clipboard ]]
vim.opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.

-- [[ Undo ]]
vim.opt.undofile = true -- Save undo history

-- [[ Searching ]]
vim.opt.ignorecase = true -- Ignore case with searching
vim.opt.smartcase = true -- Override ignorecase if search contains uppercase letters

-- [[ Timing ]]
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time

-- [[ Splits ]]
vim.opt.splitright = true -- Open vertical splits to the right
vim.opt.splitbelow = true -- Open horizontal splits below

-- [[ Indentation ]]
vim.opt.expandtab = true --Use Spaces instad of taps
vim.opt.shiftwidth = 2 -- Size for spaces using << and >>
vim.opt.tabstop = 2 -- Number of spaces a tab counts for
vim.opt.softtabstop = 2 -- Number of spaces inserted when pressing tab
vim.opt.smarttab = true -- Make tab respect shiftwidth at line start
vim.opt.smartindent = true -- Enable smart auto indentation
vim.opt.autoindent = true -- Copy indent form current line when starting a new one

-- [[ Editing behavior ]]
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.breakindent = true -- Enable break indent

vim.opt.confirm = false -- Skip save confirmation dialogs
