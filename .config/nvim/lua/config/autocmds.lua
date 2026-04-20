-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local bufnr = ev.buf

    -- Ignore specials buffers
    if vim.bo[bufnr].buftype ~= "" then
      return
    end

    local filetype = vim.bo[bufnr].filetype
    local lang = vim.treesitter.language.get_lang(filetype)
    local languages = require("config.treesitter").languages

    local config = languages[lang]
    if not lang or not config then
      return
    end

    if not config.enabled then
      return
    end

    local isCall = pcall(vim.treesitter.get_parser, bufnr, lang)
    if not isCall then
      return
    end

    vim.treesitter.start(bufnr, lang)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.opt_local.textwidth = 78
    vim.opt_local.colorcolumn = "78"
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en" }
    vim.opt_local.spelloptions = "camel"
  end,
})

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
