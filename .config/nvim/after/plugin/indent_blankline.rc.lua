local status, blankline = pcall(require, 'indent_blankline')
if not status then return end

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

-- Highlight
vim.highlight.create('IndentBlanklineChar', { guifg = '#565F89', gui='nocombine' })
vim.highlight.create('IndentBlanklineSpaceChar', { guifg = '#565F89', gui='nocombine' })
vim.highlight.create('IndentBlanklineSpaceCharBlankline', { guifg = '#565F89', gui='nocombine' })
vim.highlight.create('IndentBlanklineContextChar', { guifg = '#BB9AF7', gui='nocombine' })
vim.highlight.create('IndentBlanklineContextSpaceChar', { guifg = '#565F89', gui='nocombine' })
vim.highlight.create('IndentBlanklineContextStart', { guisp = '#BB9AF7', gui='underline' })

blankline.setup({
  show_end_of_line = false,
  show_current_context = true,

  -- BUG: Highlight not working properly (defaut false)
  show_current_context_start = false,
  test = {
    new_test = true,
  }
})
