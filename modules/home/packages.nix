{pkgs , ...} : {
  home.packages = with pkgs; [
    fastfetch
    git
    (nerdfonts.override {fonts=["JetBrainsMono"  "FiraCodeMono"];})
  ];
}
