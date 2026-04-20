return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("typescript-tools").setup({
      capabilities = capabilities,
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = {
          "organize_imports",
          "remove_unused_imports",
          "fix_all",
        },
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayVariableTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
        },
      },
    })
  end,
}
