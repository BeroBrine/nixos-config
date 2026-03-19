{ pkgs, inputs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

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
    python3
    fzf
    hyprmon

    # rustc
    # rustfmt
  ];
}
