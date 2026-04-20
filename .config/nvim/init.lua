require("config.options")
require("config.keymaps")
require("config.treesitter").init()
require("config.autocmds")
require("config.diagnostics")

require("config.lazy")

vim.cmd.colorscheme("carvion")
