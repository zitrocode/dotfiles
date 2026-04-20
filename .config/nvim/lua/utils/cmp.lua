local M = {}

M.has_words_before = function()
  local col = vim.fn.col(".") - 1

  if col == 0 then
    return false
  end

  local line = vim.fn.getline(".")

  return line:sub(col, col):match("%s") == nil
end

return M
