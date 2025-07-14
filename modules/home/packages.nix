{pkgs , ...} : {

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    git
    firefox
    kitty
    ripgrep
  ];
}
