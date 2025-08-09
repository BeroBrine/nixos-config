{pkgs , ...} : {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    htop
    ncdu
    arc-browser
    ripgrep
    neovim
    typescript
    fzf
  ];
}
