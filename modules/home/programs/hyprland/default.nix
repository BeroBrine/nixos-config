{
  imports = [
    ./hyprland.nix
    ./binds.nix
    ./packages.nix
    # ----hypr related programs---- 
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
    # ----hypr related programs end---- 
    ./windowrules.nix
    # ----animations---- 
    ./animation-dynamic.nix
    # ./animation-moving.nix
    # ./animation-end4.nix
    # ------------------ 
    ./env.nix
  ];
}
