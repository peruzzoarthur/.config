return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "eslint",
          "html",
          -- "ts_ls",
          "vtsls",
          -- "tsserver",
          "prismals",
          "dockerls",
          "jsonls",
          -- "denols",
          "yamlls",
          -- "volar",
          "gopls",
          "tailwindcss",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
          or vim.lsp.protocol.make_client_capabilities()

      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      end

      -- For Tailwind setup
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = { "typescriptreact", "javascriptreact", "typescript", "javascript", "html", "css" },
        init_options = {
          userLanguages = {
            typescriptreact = "javascript",
            javascriptreact = "javascript",
          },
        },
        -- Make the root_dir logic more flexible
        root_dir = require("lspconfig").util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js",
          "package.json"
        ),
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.vtsls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
        single_file_support = false,
        init_options = {
          hostInfo = "neovim",
          preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
            importModuleSpecifierPreference = "relative",
            importModuleSpecifier = "relative",
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            preferences = {
              importModuleSpecifier = "non-relative",
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              importModuleSpecifierPreference = "non-relative",
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
            preferences = {
              importModuleSpecifier = "non-relative",
            },
          },
        },
      })

      -- lspconfig.ts_ls.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      --   root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
      --   single_file_support = false,
      --   init_options = {
      --     hostInfo = "neovim",
      --     preferences = {
      --       includeCompletionsForModuleExports = true,
      --       includeCompletionsForImportStatements = true,
      --       importModuleSpecifierPreference = "relative",
      --       importModuleSpecifier = "relative",
      --       includeInlayParameterNameHints = "all",
      --       includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --       includeInlayFunctionParameterTypeHints = true,
      --       includeInlayVariableTypeHints = true,
      --       includeInlayPropertyDeclarationTypeHints = true,
      --       includeInlayFunctionLikeReturnTypeHints = true,
      --       includeInlayEnumMemberValueHints = true,
      --     },
      --   },
      --   settings = {
      --     typescript = {
      --       inlayHints = {
      --         includeInlayParameterNameHints = "all",
      --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --         includeInlayFunctionParameterTypeHints = true,
      --         includeInlayVariableTypeHints = true,
      --         includeInlayPropertyDeclarationTypeHints = true,
      --         includeInlayFunctionLikeReturnTypeHints = true,
      --         includeInlayEnumMemberValueHints = true,
      --       },
      --       preferences = {
      --         importModuleSpecifier = "non-relative",
      --         includeCompletionsForModuleExports = true,
      --         includeCompletionsForImportStatements = true,
      --         importModuleSpecifierPreference = "non-relative",
      --       },
      --     },
      --     javascript = {
      --       inlayHints = {
      --         includeInlayParameterNameHints = "all",
      --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --         includeInlayFunctionParameterTypeHints = true,
      --         includeInlayVariableTypeHints = true,
      --         includeInlayPropertyDeclarationTypeHints = true,
      --         includeInlayFunctionLikeReturnTypeHints = true,
      --         includeInlayEnumMemberValueHints = true,
      --       },
      --       preferences = {
      --         importModuleSpecifier = "non-relative",
      --       },
      --     },
      --   },
      -- })

      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })

      lspconfig.prismals.setup({
        capabilities = capabilities,
      })

      lspconfig.denols.setup({
        -- Disable denols by making it only work in very specific conditions
        root_dir = function(fname)
          -- Only enable denols if there's a deno.json/deno.jsonc file
          return lspconfig.util.root_pattern("deno.json", "deno.jsonc")(fname)
        end,
        single_file_support = false,
      })
      -- lspconfig.volar.setup({
      --   init_options = {
      --     vue = {
      --       hybridMode = false,
      --     },
      --   },
      -- })
      lspconfig.gopls.setup({})

      -- Keymaps for LSP functionality
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
      vim.api.nvim_set_keymap(
        "n",
        "<leader>oi",
        '<cmd>lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })<CR>',
        { noremap = true, silent = true }
      )
    end,
  },
}
