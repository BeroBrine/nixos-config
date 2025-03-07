{pkgs , ...} : {
  home.packages = with pkgs; [
    fastfetch
    git
  ];
}
