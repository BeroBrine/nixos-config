{pkgs , ...}:{
  programs.nvf.settings.vim = {
    treesitter = {
      enable = true;
      addDefaultGrammars = true;
      autotagHtml = true;
      grammars = [
        pkgs.vimPlugins.nvim-treesitter.builtGrammars.typescript
        pkgs.vimPlugins.nvim-treesitter.builtGrammars.rust
      ];

      context.enable = false;
      highlight.enable = true;
      indent.enable = true;
    };
  };
}
