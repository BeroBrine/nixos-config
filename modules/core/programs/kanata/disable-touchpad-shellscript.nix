{ pkgs, ... }:

let
  toggletouchpad = pkgs.writeShellScriptBin "toggletouchpad" ''

    #!${pkgs.bash}/bin/bash
    # Put your shebang here (optional, but recommended)

    DEVICE="apple-spi-touchpad"   # Change to your actual device name

    STATE=$(hyprctl -j getoption "device:${DEVICE}:enabled" | ${pkgs.jq}/bin/jq -r '.int')

    if [ "$STATE" = "1" ]; then
      hyprctl keyword "device:${DEVICE}:enabled" false
      ${pkgs.libnotify}/bin/notify-send "Touchpad Disabled" "Trackpad is now OFF"
    else
      hyprctl keyword "device:${DEVICE}:enabled" true
      ${pkgs.libnotify}/bin/notify-send "Touchpad Enabled" "Trackpad is now ON"
    fi
  '';
in
{
  environment.systemPackages = [ toggletouchpad ];
}
