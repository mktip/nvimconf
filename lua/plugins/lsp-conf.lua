local config = function()
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = false,
        -- delay update diagnostics
        update_in_insert = false
        -- display_diagnostic_autocmds = { "InsertLeave" },
      })

  local sumneko_binary = vim.fn.expand("~/.nix-profile/bin/lua-language-server")
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  require 'lspconfig'.lua_ls.setup {
    cmd = { sumneko_binary },
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim', 'use' }
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = { enable = false }
      }
    }
  }

  require 'lspconfig'.rnix.setup {}
  require 'lspconfig'.clangd.setup {}
  require 'lspconfig'.svelte.setup {}
  require 'lspconfig'.pylsp.setup {}
  require 'lspconfig'.rust_analyzer.setup {}
  require 'lspconfig'.gopls.setup {}
  require 'lspconfig'.ocamllsp.setup {}
  require 'lspconfig'.clojure_lsp.setup {}
  require 'lspconfig'.texlab.setup {}
  require 'lspconfig'.ruby_ls.setup {}

  -- require'lspconfig'.tailwindcss.setup {}
  -- require'lspconfig'.tsserver.setup {path = "~/.nix-profile/bin/tsserver"}
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neodev.nvim",   opts = { experimental = { pathStrict = true } } },
    { "hrsh7th/cmp-nvim-lsp" },
  },
  config = config
}
