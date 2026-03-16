{
  imports = [
    ./jsonls.nix
  ];

  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;

      lspconfig.enable = true;
      nvim-docs-view.enable = true;
      trouble.enable = true;
    };
  };
}
