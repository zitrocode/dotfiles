local M = {}

M.languages = {
  lua = {
    enabled = true,
    filetypes = "lua",
  },
  javascript = {
    enabled = true,
    filetypes = { "javascript", "javascriptreact" },
  },
  typescript = {
    enabled = true,
    filetypes = "typescript",
  },
  tsx = {
    enabled = true,
    filetypes = "typescriptreact",
  },
}

M.init = function(opts)
  for lang, config in pairs(M.languages) do
    if not config.enabled then
      goto continue
    end

    local ok = vim.treesitter.language.add(lang)

    if not ok then
      vim.notify("Treesitter parser not found: " .. lang, vim.log.levels.WARN)
      goto continue
    end

    vim.treesitter.language.register(lang, config.filetypes)
    ::continue::
  end
end

return M
