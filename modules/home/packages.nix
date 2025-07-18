{pkgs , ...} : {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    firefox
    ripgrep
    neovim
    typescript
    fzf
  ];
}
