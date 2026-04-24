return {
  "neovim/nvim-lspconfig",
  -- event = { "BufReadPre", "BufNewFile" },
  event = "VeryLazy",
  config = function()
    -- Extend LSP capabilities so completion works with nvim-cmp
    -- Without this, LSP completion features will be limited.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- This function runs when a language server attaches to a buffer
    -- It defines buffer-local keymaps for LSP actions.
    local on_attach = function(_, bufnr)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Go to definition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "LSP: Go to declaration" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "LSP: Go to implementation" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP: List references" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Show documentation" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP: Rename symbol" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP: Code actions" })
    end

    -- Load diagnostic UI configuration
    -- This controls icons, virtual text, float style, etc.
    local diagnostics = require("config.diagnostics")
    diagnostics.setup()

    -- Lua language Server configuration
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,

      filetypes = { "lua" },
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          completion = {
            keywordSnippet = "Both",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              -- vim.api.nvim_get_runtime_file("", true),
              vim.env.VIMRUNTIME,
              -- "${3rd}/luv/library",
            },
          },
          telemetry = { enable = false },
        },
      },
    })

    -- Typescript and Javascript Language Server
    -- vim.lsp.config('ts_ls', {
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   filetypes = {
    --     'typescriptreact',
    --     'typescript',
    --     'javascriptreact',
    --     'javascript',
    --   },
    --   settings = {
    --     typescript = {
    --       inlayHints = {
    --         includeInlayParameterNameHints = 'all',
    --         includeInlayVariableTypeHints = true,
    --         includeInlayFunctionParameterTypeHints = true,
    --       },
    --     },
    --     javascript = {
    --       includeInlayParameterNameHints = 'all',
    --     },
    --   },
    -- })

    -- Eslint configuration
    vim.lsp.config("eslint", {
      capabilities = capabilities,
      settings = {
        workingDirectory = { mode = "auto" },
        format = false,
      },
    })

    -- JSON configuration
    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      on_attach = on_attach,

      filetypes = { "json", "jsonc" },
      settings = {
        json = {
          validate = { enable = true },
        },
      },
    })

    -- HTML configuration
    vim.lsp.config("html", {
      capabilities = capabilities,
      on_attach = on_attach,

      filetypes = {
        "html",
      },
    })

    -- CSS configuration
    vim.lsp.config("cssls", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "css",
        "scss",
        "less",
      },
    })

    vim.lsp.enable("lua_ls")
    -- vim.lsp.enable('ts_ls')
    vim.lsp.enable("eslint")
    vim.lsp.enable("jsonls")
    vim.lsp.enable("html")
    vim.lsp.enable("cssls")
  end,
}
