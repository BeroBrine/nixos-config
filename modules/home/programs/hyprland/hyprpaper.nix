{hostname , ...}: let 
inherit 
  (import ../../../../hosts/${hostname}/variables.nix) stylixImage;
 in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload =
        ["${stylixImage}"];

      wallpaper = [
        "eDP-1,${stylixImage}"
      ];
    };
  };
}
