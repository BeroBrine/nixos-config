{hostname, ...}: let inherit
  (import ../../../../hosts/${hostname}/variables.nix) stylixImage
; in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 2;
        hide_cursor = true;
        no_fade_in = false;
      };
      background = [
        {
          path = "${stylixImage}";
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      image = [
        {
          path = "${stylixImage}";
          size = 150;
          border_size = 4;
          rounding = -1; # Negative means circle
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];
     label = [
        {
          text = "$USER";
          text_align = "center";
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 25;
          font_family = "Noto Sans";
          rotate = 0;
          position = "0, -30";
          halign = "center";
          valign = "center";
        }
      ];
      input-field = [
        {
          size = "200, 50";
          position = "0, -120";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          outline_thickness = 5;
          placeholder_text = "Password...";
          shadow_passes = 2;
        }
      ];
    };
  };
}
