local status, tokyonight = pcall(require, 'tokyonight')
if not status then return end

local let = vim.g

let.tokyonight_style = 'night'
let.tokyonight_terminal_colors = true
let.tokyonight_italic_comments = true
let.tokyonight_italic_keywords = true
let.tokyonight_italic_functions = false
let.tokyonight_italic_variables = false
let.tokyonight_transparent = true
let.tokyonight_hide_inactive_statusline = false
let.tokyonight_sidebars = { 'packer' }
let.tokyonight_transparent_sidebar = false
let.tokyonight_dark_sidebars = true
let.tokyonight_dark_float = true
let.tokyonight_colors = {}
let.tokyonight_day_brightness = 0.3
let.tokyonight_lualine_bold = false

-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]
