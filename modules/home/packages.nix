{pkgs , ...} : {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    htop
    ncdu
    ripgrep
    cargo
    android-tools
    jdk17
    brave
    scrcpy
    neovim
    rar
    typescript
    autoraise
    fzf
    rustc
    rustfmt
  ];
}
