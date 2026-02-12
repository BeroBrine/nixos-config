{pkgs , ...} : {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    htop
    ncdu
    ripgrep
    # cargo
    jdk17
    brave
    scrcpy
    firefox
    gnumake
    cmake
    tree
    neovim
    typescript
    fzf
    # rustc
    # rustfmt
  ];
}
