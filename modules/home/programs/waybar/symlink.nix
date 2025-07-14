{pkgs , ...}:{
  home.packages = [pkgs.waybar];
  home.file = {
    ".config/waybar" = {
      source = ./waybar;
      recursive = true;
    };
  };
}
