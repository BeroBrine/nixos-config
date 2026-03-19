{
  pkgs,
  hostname,
  ...
}: let
  inherit (import ../../hosts/${hostname}/variables.nix) stylixImage;
in {
  # Styling Options
  stylix = {
    enable = true;
    # image = stylixImage;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      hyprland.enable = true;
      kitty.enable = true;
      rofi.enable = false;
      gtk.enable = true;
      hyprlock.enable = false;
      # hyprlock.enable = false;
      neovim.enable = true;
      nvf = {
        enable = false;
        transparentBackground = true;
      };
    };
    opacity = {
      terminal = 0.65;
    };

    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 14;
        terminal = 14;
        desktop = 12;
        popups = 12;
      };
    };
  };
}
