{pkgs , ...} : {
  home.packages = with pkgs; [
    fastfetch
    git
    firefox
    kitty
    ripgrep
  ];
}
