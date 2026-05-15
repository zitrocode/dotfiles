require("config.options")
require("config.keymaps")
require("config.autocmds")

require("core.treesitter").setup()
require("core.lsp")

require("config.lazy")

vim.cmd.colorscheme("carvion")
