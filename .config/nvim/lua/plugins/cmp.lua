return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Snippets Engine & its associated nvim-cmp source.
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end

        return "make install_jsregexp"
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
      },
    },
    "saadparwaiz1/cmp_luasnip",

    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default.They are split
    --  into multiple repos for maintenance purposes.
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",

    -- Icons
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      preselect = cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
        -- If you prefer more traditional completion keymaps,
        -- you can uncomment the following lines.
        -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- ["<Tab>"] = cmp.mapping.select_next_item(),
        -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),

        -- Select the [n]ext item
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Select the [p]evious item
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        -- Scroll the documentation window [b]lack / [f]orward
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),

        -- Manually trigger a completion form nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ["<C-Space>"] = cmp.mapping.complete({}),

        -- Think of <C-l> as moving to the right of your snippets expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        --  <C-l> will move you to the right of each of the expansion locations.
        --  <C-h> is similar, except moving you backwards.
        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable(-1) then
            luasnip.expand_or_jump(-1)
          end
        end, { "i", "s" }),

        -- For more advanced LuaSnip keymaps (e.g. selecting choice nodes, expansion) See:
        --  https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      }),
      formatting = {
        -- Defines the order of elements displayed, in each completion item.
        --  `icon` symbol icon
        --  `abbr` main text (the completion label)
        --  `kind` source of the completion (e.g. LSP, bufferm snippet, etc.)
        fields = { "icon", "abbr", "kind", "menu" },

        -- Use lspkind to format completion item by adding
        -- icons and symbol label simmilar to VSCode-Styles completion.
        format = require("lspkind").cmp_format(),
        --  Displays additional label details provided by the LSP,
        --  when supported.
        --
        --  method(arg: string): string
        --               ↑ This part is labelDetails
        --  Not all lsp servers supported this feature.
        show_labelDetails = true,
      },
      experimental = {
        -- Enable ghost text in the completion system.
        -- Ghost text show a preview of the currently selected
        -- completion item directly inline in the buffer,
        -- displayed asn faint of dimmed text.
        --
        --  pri|
        --     ntln() ← shown as ghost text preview
        -- This allows you to preview what will be inserted
        -- without commiting the completion.
        ghost_text = true,
      },
      sources = {
        {
          name = "lazydev",
          -- Set `group_index` to 0 to skip loading LuaLS completions as lazydev recommends it
          group_index = 0,
        },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      },
    })
  end,
}
