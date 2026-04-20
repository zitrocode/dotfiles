return {
  "folke/lazydev.nvim",
  ft = "lua",
  dependencies = {
    "Bilal2453/luvit-meta",
    "gonstoll/wezterm-types",
    { "LuaCATS/luassert", name = "luassert-types" },
    { "LuaCATS/busted", name = "busted-types" },
  },
  opts = {
    library = {
      { path = vim.env.VIMRUNTIME },
      { path = "luvit-meta/library", words = { "vim%.uv" } },
      { path = "wezterm-types", mods = { "wezterm" } },
      { path = "${3rd}/lazy.nvim/lua", words = { "LazySpec" } },
      { path = "luassert-types", words = { "assert" } },
      { path = "busted-types/library", words = { "describe" } },
    },
  },
}
