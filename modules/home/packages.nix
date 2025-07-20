{pkgs , ...} : {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    htop
    arc-browser
    ripgrep
    typescript
    fzf
  ];
}
