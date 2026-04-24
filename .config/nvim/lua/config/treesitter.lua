local M = {}

local languages = {
  lua = { "lua" },
  javascript = {
    "javascript",
    "javascriptreact",
  },
  typescript = { "typescript" },
  tsx = { "typescriptreact" },
}

--- Attempt to load a Treesitter parser.
--- @param lang string
--- @return boolean
local function load_parser(lang)
  return pcall(vim.treesitter.language.add, lang)
end

--- Register filetypes for a given parser.
--- @param lang string
--- @param filetypes string[]
local function register_filetypes(lang, filetypes)
  vim.treesitter.language.register(lang, filetypes)
end

--- Check whether Treesitter can be started safely.
--- @param bufnr number
--- @param lang string
--- @return boolean
local function parser_available(bufnr, lang)
  return pcall(vim.treesitter.get_parser, bufnr, lang)
end

--- Register all configuration Treesitter languages,
--- load parsers and binds their filetypes.
function M.register_languages()
  for lang, filetypes in pairs(languages) do
    local ok = load_parser(lang)

    if not ok then
      vim.notify("Treesitter parser not found: " .. lang, vim.log.levels.WARN)
      return
    end

    register_filetypes(lang, filetypes)
  end
end

--- Start Treesitter automatically when a buffer
--- with a supported filetypes is opened.
function M.create_autocmd()
  vim.api.nvim_create_autocmd("FileType", {
    callback = function(event)
      local bufnr = event.buf

      -- Skip special buffers (terminal, help, etc.)
      if vim.bo[bufnr].buftype ~= "" then
        return
      end

      local filetype = vim.bo[bufnr].filetype
      local lang = vim.treesitter.language.get_lang(filetype)

      if not lang or not languages[lang] then
        return
      end

      if parser_available(bufnr, lang) then
        vim.treesitter.start(bufnr, lang)
      end
    end,
  })
end

function M.setup()
  M.register_languages()
  M.create_autocmd()
end

return M
