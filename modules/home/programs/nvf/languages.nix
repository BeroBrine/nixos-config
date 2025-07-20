{pkgs, ...}:{
  programs.nvf.settings.vim = { 
    languages = {
      nix = {
        enable = true;
        extraDiagnostics.enable = false;
        lsp.enable = true;
        treesitter.enable = true;
      };

      python = {
        enable = true;
        dap.enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      rust = {
        enable = true;
        dap.enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;

        crates = {
          enable = true;
          codeActions = true;
        };
      };

      ts = {
        enable = true;
        extensions.ts-error-translator.enable = true;
        extraDiagnostics.enable = false;
        format = {
          enable = true;
          package = pkgs.prettierd;
        };
        lsp.enable = true;
        treesitter.enable = true;
      };
    };
  };
}
