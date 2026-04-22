local dependecies_default = {
  "nvim-lua/plenary.nvim",
}

---@class lazy.Options
---@field lazy boolean?
---@field priority number?
---@field event string|string[]?
---@field cmd string|string[]?
---@field ft string|string[]?
---@field keys table[]?
---@field build string|fun()?
---@field version string?
---@field enabled boolean?
---@field config fun(plugin: table)?
---@field opts table?
---@field dependencies string[]?

--- Create a Lazy.nvim plugin specification for a local plugin.
--- This helper build a plugin spec using a local directory inside
--- `~/projects/plugins/`, automatically adding default dependecies
--- and marging user-provided options.
---
---@param name string: Plugin folder name
---@param options lazy.Options[]?: Extra plugins options
---@param extra_dependecies string[]?: Extra dependicies
---@return table: Plugin specification
local function plugin(name, options, extra_dependecies)
  options = options or {}
  extra_dependecies = extra_dependecies or {}

  local base_dir = vim.fn.expand("~/projects/plugins")
  local plugin_path = vim.fs.joinpath(base_dir, name)
  local dependecies = vim.deepcopy(dependecies_default)

  for _, dependency in ipairs(extra_dependecies) do
    table.insert(dependecies, dependency)
  end

  local spec = {
    dir = plugin_path,
    name = name,
    dependencies = dependecies,
  }

  for key, value in pairs(options) do
    spec[key] = value
  end

  return spec
end

return {
  plugin("spot.nvim"),
  plugin("present.nvim"),
  plugin("carvion.nvim", { priority = 1000 }),
}
