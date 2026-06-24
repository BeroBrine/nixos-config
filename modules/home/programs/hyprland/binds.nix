{ hostname, pkgs, ... }:
let
  inherit (import ../../../../hosts/${hostname}/variables.nix)
    browser
    terminal
    fileManager
    mainMod
    ;

  # Elite Wayland Dynamic Focus Brightness Hook
  dynamicBrightness = pkgs.writeShellScriptBin "dynamic-brightness" ''
    # Interrogate Hyprland for the monitor hosting the active workspace
    ACTIVE_MONITOR=$(${pkgs.hyprland}/bin/hyprctl -j activeworkspace | ${pkgs.jq}/bin/jq -r '.monitor')

    if [ "$ACTIVE_MONITOR" = "eDP-1" ]; then
      # Focused on MacBook Screen -> DSI Backlight Controller
      if [ "$1" = "up" ]; then
        ${pkgs.brightnessctl}/bin/brightnessctl set 5%+
      else
        ${pkgs.brightnessctl}/bin/brightnessctl set 5%-
      fi
    else
      # Focused on External Display -> DDC/CI Hardware I2C Pulse (VCP 10)
      if [ "$1" = "up" ]; then
        ${pkgs.ddcutil}/bin/ddcutil setvcp 10 + 5 --noverify
      else
        ${pkgs.ddcutil}/bin/ddcutil setvcp 10 - 5 --noverify
      fi
    fi
  '';
in
{
  # Inject the derivation into your active Home Manager session
  home.packages = [ dynamicBrightness ];

  wayland.windowManager.hyprland.settings = {
    "$modifier" = mainMod;

    # -----------------------------------------------------
    # Standard Keybindings
    # -----------------------------------------------------
    bind = [
      "$modifier,SPACE,exec,noctalia msg panel-toggle launcher"
      "$modifier SHIFT,L,exec,noctalia msg session lock"
      "$modifier SHIFT,V,exec,noctalia msg panel-toggle clipboard"
      "$modifier SHIFT,S,exec,noctalia msg screenshot-region"
      "$modifier SHIFT,E,exec,noctalia msg panel-toggle emoji"

      "$modifier SHIFT,down,exec,brightnessctl --device='kbd_backlight' set 10%-"
      "$modifier SHIFT,up,exec,brightnessctl --device='kbd_backlight' set 10%+"

      # Apps
      "$modifier,Return,exec,uwsm app -- ${terminal}"
      "$modifier,B,exec,uwsm app -- ${browser}"
      "$modifier,E,exec,uwsm app -- ${fileManager}"
      "$modifier,D,exec,uwsm app -- discord"
      "$modifier,O,exec,uwsm app -- obs"
      "$modifier,C,exec,hyprpicker -a"
      "$modifier,G,exec,uwsm app -- gimp"
      "$modifier,T,exec,pypr toggle term"
      "$modifier,M,exec,pavucontrol"
      "$modifier,W,exec,switch-wallpaper"

      # Window Management
      "$modifier,Q,killactive,"
      "$modifier,P,pseudo,"
      "$modifier,V,exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      "$modifier SHIFT,I , layoutmsg ,togglesplit,"
      "$modifier,F,fullscreen,"
      "$modifier SHIFT,F,togglefloating,"
      "$modifier ALT,F,workspaceopt, allfloat"
      "$modifier SHIFT,C,exit,"

      # Focus and Movement
      "$modifier,h,movefocus,l"
      "$modifier,l,movefocus,r"
      "$modifier,k,movefocus,u"
      "$modifier,j,movefocus,d"
      "$modifier SHIFT,h,swapwindow,l"
      "$modifier SHIFT,l,swapwindow,r"
      "$modifier SHIFT,k,swapwindow,u"
      "$modifier SHIFT,j,swapwindow,d"

      "$modifier SHIFT,left,movewindow,l"
      "$modifier SHIFT,right,movewindow,r"
      "$modifier SHIFT,up,movewindow,u"
      "$modifier SHIFT,down,movewindow,d"

      "$modifier ALT, left, swapwindow,l"
      "$modifier ALT, right, swapwindow,r"
      "$modifier ALT, up, swapwindow,u"
      "$modifier ALT, down, swapwindow,d"

      # Workspaces
      "$modifier,1,workspace,1"
      "$modifier,2,workspace,2"
      "$modifier,3,workspace,3"
      "$modifier,4,workspace,4"
      "$modifier,5,workspace,5"
      "$modifier,6,workspace,6"
      "$modifier,7,workspace,7"
      "$modifier,8,workspace,8"
      "$modifier,9,workspace,9"
      "$modifier,0,workspace,10"
      "$modifier SHIFT,SPACE,movetoworkspace,special"
      "$modifier SHIFT,1,movetoworkspace,1"
      "$modifier SHIFT,2,movetoworkspace,2"
      "$modifier SHIFT,3,movetoworkspace,3"
      "$modifier SHIFT,4,movetoworkspace,4"
      "$modifier SHIFT,5,movetoworkspace,5"
      "$modifier SHIFT,6,movetoworkspace,6"
      "$modifier SHIFT,7,movetoworkspace,7"
      "$modifier SHIFT,8,movetoworkspace,8"
      "$modifier SHIFT,9,movetoworkspace,9"
      "$modifier SHIFT,0,movetoworkspace,10"

      "$modifier CONTROL,right,workspace,e+1"
      "$modifier CONTROL,left,workspace,e-1"
      "$modifier,mouse_down,workspace, e+1"
      "$modifier,mouse_up,workspace, e-1"
      "ALT,Tab,cyclenext"
      "ALT,Tab,bringactivetotop"
    ];

    # -----------------------------------------------------
    # Media & Dynamic Brightness Hook (Repeatable while held)
    # -----------------------------------------------------
    bindel = [
      # Volume
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

      # Hooked Dynamic Brightness
      ",XF86MonBrightnessDown, exec, dynamic-brightness down"
      ",XF86MonBrightnessUp, exec, dynamic-brightness up"
    ];

    bindl = [
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"
      ",switch:on:Lid Switch, exec, noctalia msg session lock"
    ];

    bindm = [
      "$modifier, mouse:272, movewindow"
      "$modifier, mouse:273, resizewindow"
    ];
  };
}
