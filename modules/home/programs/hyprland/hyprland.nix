{ pkgs
, hostname
, ...
}:
let
  inherit (import ../../../../hosts/${hostname}/variables.nix)
    stylixImage
    ;
in
{

  wayland.windowManager.hyprland = {
    enable = true;

    package = pkgs.hyprland;

    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };

    xwayland = {
      enable = true;
    };

    settings = {

      exec-once = [
        # "caelestia shell -d"
        "hyprctl setcursor Bibata-Modern-Ice 24"
        "wl-paste --type text --watch cliphist store # Stores only text data"
        "export HYPRLAND_CONFIG=~/.config/hypr/dynamic.conf"
        "wl-paste --type image --watch cliphist store # Stores only image data"
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
        # "killall -q waybar;sleep .5 && waybar"
        "nm-applet --indicator"
        "nm-applet --indicator"

        # # "pypr &"
      ];

      monitor = [
        "DP-1, 1920x1080@100, 0x0, 0.8"
        # "eDP-1, 2560x1600@60, 0x1080, 1.3333334"
        "eDP-1, 2560x1600@60, 0x1350, 1.25"
      ];

      workspace = [
        "1, monitor:DP-1"
        "2, monitor:eDP-1"
      ];

      input = {
        repeat_delay = 180;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.8;
        };
      };

      general = {
        layout = "dwindle";
        gaps_in = 6;
        gaps_out = 8;
        border_size = 2;
        resize_on_border = true;
      };

      master = {
        new_status = "master";
        new_on_top = 1;
        mfact = 0.5;
      };

      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 2; # change to 1 if want to disable
        enable_hyprcursor = false;
        warp_on_change_workspace = 1;
        no_warps = false;
      };

      misc = {
        layers_hog_keyboard_focus = true;
        initial_workspace_tracking = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = false;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = false;
        vfr = true; # Variable Frame Rate
        vrr = 2; # Variable Refresh Rate  Might need to set to 0 for NVIDIA/AQ_DRM_DEVICES
        # Screen flashing to black momentarily or going black when app is fullscreen
        # Try setting vrr to 0
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = true;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
      };
    };

  };

}
