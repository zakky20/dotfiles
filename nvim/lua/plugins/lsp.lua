return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Setup capabilities with nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_ok and cmp_nvim_lsp.default_capabilities then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      elseif cmp_ok and cmp_nvim_lsp.update_capabilities then
        capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
      end
      
      -- Keymaps on LSP attach
      local function on_attach(client, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        
        map('n', 'gd', vim.lsp.buf.definition, "Go to definition")
        map('n', 'gr', vim.lsp.buf.references, "References")
        map('n', 'K', vim.lsp.buf.hover, "Hover docs")
        map('n', '<leader>rn', vim.lsp.buf.rename, "Rename symbol")
        map({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, "Code action")
        map('n', '<leader>f', function()
          vim.lsp.buf.format({ async = true })
        end, "Format buffer")
        
        -- Disable formatting for LSPs that conflict with conform
        if client.name == "ts_ls" or client.name == "html" then
          client.server_capabilities.documentFormattingProvider = false
        end
      end
      
      -- LSP Servers configuration
      local servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=never",
            "--offset-encoding=utf-16",
          },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          capabilities = capabilities,
          on_attach = on_attach,
        },
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          capabilities = capabilities,
          on_attach = on_attach,
        },
          capabilities = capabilities,
          on_attach = on_attach,
        },
        html = {
          cmd = { "vscode-html-language-server", "--stdio" },
          filetypes = { "html" },
          capabilities = capabilities,
          on_attach = on_attach,
        },
        lua_ls = {
          cmd = { "lua-language-server" },
          filetypes = { "lua" },
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = {
                  "vim",
                  "require"
                },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = {
                enable = false,
              },
            },
          },
          capabilities = capabilities,
          on_attach = on_attach,
        },
        ts_ls = {
          cmd = { "typescript-language-server", "--stdio" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
          capabilities = capabilities,
          on_attach = on_attach,
        },
        zls = {
          cmd = { "zls" },
          filetypes = { "zig", "zir" },
          capabilities = capabilities,
          on_attach = on_attach,
        }
      }
      
      -- Setup LSP servers using new vim.lsp.config API
      for name, config in pairs(servers) do
        -- Check if the command exists before setting up
        if vim.fn.executable(config.cmd[1]) == 1 then
          vim.lsp.config[name] = config
          vim.lsp.enable(name)
        else
          vim.notify(
            "LSP '" .. name .. "' command '" .. config.cmd[1] .. "' not found. Please install it.",
            vim.log.levels.WARN
          )
        end
      end

      -- Diagnostics display
      vim.diagnostic.config({
        virtual_text = { spacing = 2, prefix = "●" },
        float = { border = "rounded" },
        severity_sort = true,
        update_in_insert = false,
      })
    end,
  },
}
