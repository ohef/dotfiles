return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config('ts_ls', {
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      }
    })

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    vim.lsp.enable('bashls')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('pyright')

    pcall(vim.keymap.del, "n", "grr")
    vim.keymap.set("n", "gdr", vim.lsp.buf.references, {
      desc = "LSP references",
    })
    vim.keymap.set('n', 'gdd', vim.lsp.buf.definition)
  end
}
