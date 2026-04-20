local M = {}

M.rename_current = function()
  local old_name = vim.fn.expand("%:p")
  local new_name = vim.fn.input("New name: ", old_name, "file")

  if new_name == "" then
    return
  end
  if new_name == old_name then
    return
  end

  local success, err = os.rename(old_name, new_name)

  if not success then
    vim.notify("Rename failed: " .. err, vim.log.levels.ERROR)
    return
  end

  vim.cmd("edit" .. new_name)
  vim.notify("File renamed to: " .. new_name, vim.log.levels.INFO)
end

return M
