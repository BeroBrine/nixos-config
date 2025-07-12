{pkgs , ...}:{

  home.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono"  "FiraCode"]; })
  ];
  fonts.fontconfig.enable = true;
}
