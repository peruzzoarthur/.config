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
          "ts_ls",
          "prismals",
          "dockerls",
          "jsonls",
          "denols",
          "yamlls",
          "volar",
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
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json"),
        single_file_support = false,
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "non-relative", -- or "project-relative"
            },
          },
          javascript = {
            preferences = {
              importModuleSpecifier = "non-relative",
            },
          },
        },
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      -- Add Prisma Language Server setup
      lspconfig.prismals.setup({
        capabilities = capabilities,
      })

      lspconfig.denols.setup({
        on_attach = on_attach,
        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
      })

      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        root_dir = lspconfig.util.root_pattern("package.json"),
        single_file_support = false,
      })

      lspconfig.volar.setup({
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      })
      lspconfig.gopls.setup({})

      -- Keymaps for LSP functionality
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
    end,
  },
}
