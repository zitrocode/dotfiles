local status, formatter = pcall(require, 'formatter')
if not status then return end

local prettier = function ()
  return {
    exe = 'prettier',
    args = {
      '--stdin-filepath',
      vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
    },
    stdin = true,
  }
end

formatter.setup({
  logging = false,
  filetype = {
    javascript = { prettier },
		typescript = { prettier },
		javascriptreact = { prettier },
		typescriptreact = { prettier },
		['javascript.jsx'] = { prettier },
		['typescript.tsx'] = { prettier },
		markdown = { prettier },
		css = { prettier },
		json = { prettier },
		scss = { prettier },
		less = { prettier },
  }
})

-- Auto format
local extensions = {'*.tsx', '*.jsx', '*.ts', '*.js', '*.md', '*.css', '*.json', '*.scss', '*.less'}
local group = vim.api.nvim_create_augroup('NeoFormat', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  group = group,
  pattern = extensions,
  command = 'FormatWrite'
});
