{pkgs, ...}: {
  programs.nvf.settings.vim.extraPlugins.schemastore = {
    package = pkgs.vimPlugins.SchemaStore-nvim;
  };

  programs.nvf.settings.vim.lsp.lspconfig.sources.jsonls = ''
    lspconfig.jsonls.setup {
      capabilities = capabilities,
      cmd = {
        "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server",
        "--stdio"
      },

      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true }
        }
      }
    }
  '';
}
