{pkgs , ...}:{
  home.packages = with pkgs; [
      nerd-fonts.
      nerd-fonts.FiraCode
  ];
  fonts.fontconfig.enable = true;
}
