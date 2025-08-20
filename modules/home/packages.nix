{pkgs , ...} : {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    htop
    ncdu
    ripgrep
    rustc
    cargo
    android-tools
    rustfmt
    jdk17
    brave
    scrcpy
    neovim
    typescript
    fzf
  ];
}
