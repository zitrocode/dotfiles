-- Author: Oscar Ortiz (zitrocode)
-- Last update: December 29, 2023
-- GitHub: https://github.com/zitrocode/dotfiles

require('zitro.base')
require('zitro.hightlights')
require('zitro.maps')
require('zitro.plugins')

vim.g.closetag_filenames = "*.html, *.jsx, *.tsx"

-- Set transparent
vim.cmd('au ColorScheme * hi Normal ctermbg=none guibg=none')
-- Set theme `gruvbox`
vim.cmd('colorscheme gruvbox')
