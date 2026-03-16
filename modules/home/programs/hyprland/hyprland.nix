{pkgs , username , config , hostname ,...}:
let 
  inherit 
     (import ../../../../hosts/${hostname}/variables.nix) stylixImage ;
in {

  wayland.windowManager.hyprland = {
    enable = true;

    package = pkgs.hyprland;

    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = ["--all"];
    };

    xwayland = {
      enable = true;
    };


    settings = {

      exec-once = [
        "caelestia shell -d"
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
        "eDP-1, 2560x1664, 1920x0, 1.4"
        "DP-1, 1920x1080@100, 0x0, 1"
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
        warp_on_change_workspace = 2;
        no_warps = true;
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
        vrr = 2; #Variable Refresh Rate  Might need to set to 0 for NVIDIA/AQ_DRM_DEVICES
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
     
    # extraConfig = ''
    #       # Source a user-editable file for dynamic stuff (monitors, profiles, etc.)
    #       # source = ~/.config/hypr/dynamic.conf
    #
    #       # Your fixed monitor as fallback (if dynamic.conf doesn't exist yet)
    #       monitor = eDP-1, 2560x1664, 1920x0, 1.40000
    #       monitor = DP-1, 1920x1080@100, 0x0, 1
    #     '';


  };



}
